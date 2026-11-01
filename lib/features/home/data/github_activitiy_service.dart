import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ramajana05/features/home/data/domain/current_project.dart';

class GitHubActivityService {
  static final _storage = SharedPreferencesAsync();

  static final Map<String, Future<GitHubActivity>> _pending = {};

  static const _cacheDuration = Duration(hours: 24);
  static const _blockedKey = 'github_activity_blocked_until_v1';

  Future<GitHubActivity> load(String repositoryUrl) async {
    final uri = Uri.parse(repositoryUrl);

    final parts = uri.pathSegments.where((part) => part.isNotEmpty).toList();

    if (uri.scheme != 'https' ||
        uri.host != 'github.com' ||
        parts.length != 2) {
      throw ArgumentError(
        'Use https://github.com/OWNER/REPOSITORY',
      );
    }

    final owner = parts[0];
    final repo = parts[1].replaceFirst(RegExp(r'\.git$'), '');
    final key = '$owner/$repo'.toLowerCase();

    // Share an already running request within this app.
    final existing = _pending[key];

    if (existing != null) {
      return existing;
    }

    final future = _loadCached(
      owner: owner,
      repo: repo,
      key: key,
    );

    _pending[key] = future;

    try {
      return await future;
    } finally {
      _pending.remove(key);
    }
  }

  Future<GitHubActivity> _loadCached({
    required String owner,
    required String repo,
    required String key,
  }) async {
    final cacheKey = 'github_activity_v3_$key';
    final failureKey = '${cacheKey}_retry_after';

    final now = DateTime.now().toUtc();

    GitHubActivity? cachedActivity;

    // Read persistent browser cache.
    final raw = await _read(cacheKey);

    if (raw != null) {
      try {
        final json = jsonDecode(raw) as Map<String, dynamic>;

        final fetchedAt = DateTime.parse(
          json['fetchedAt'] as String,
        ).toUtc();

        cachedActivity = _decodeActivity(json);

        final age = now.difference(fetchedAt);

        if (!age.isNegative && age < _cacheDuration) {
          return cachedActivity;
        }
      } catch (_) {
        // Ignore invalid or outdated cache formats.
      }
    }

    // A recorded rate limit applies across repositories.
    final blockedRaw = await _read(_blockedKey);

    final blockedUntil =
        blockedRaw == null ? null : DateTime.tryParse(blockedRaw)?.toUtc();

    if (blockedUntil != null && now.isBefore(blockedUntil)) {
      if (cachedActivity != null) {
        return cachedActivity;
      }

      throw GitHubActivityException(
        ActivityStatus.rateLimited,
        retryAt: blockedUntil,
      );
    }

    // Prevent repeated requests after other failures.
    final failureRaw = await _read(failureKey);

    final retryAfter =
        failureRaw == null ? null : DateTime.tryParse(failureRaw)?.toUtc();

    if (retryAfter != null && now.isBefore(retryAfter)) {
      if (cachedActivity != null) {
        return cachedActivity;
      }

      throw const GitHubActivityException(
        ActivityStatus.error,
      );
    }

    try {
      final result = await _fetch(owner, repo);

      await _write(
        cacheKey,
        jsonEncode({
          'fetchedAt': DateTime.now().toUtc().toIso8601String(),
          'windowStart': result.windowStart.toIso8601String(),
          'days': result.activity.days,
          'lastCommit': result.activity.lastCommit?.toIso8601String(),
          'commits': [
            for (final commit in result.activity.latestCommits)
              {
                'message': commit.message,
                'sha': commit.sha,
                'url': commit.url,
                'date': commit.date.toIso8601String(),
              },
          ],
        }),
      );

      await _remove(failureKey);

      return result.activity;
    } catch (error) {
      final failedAt = DateTime.now().toUtc();

      if (error is GitHubActivityException &&
          error.status == ActivityStatus.rateLimited) {
        var retryAt = error.retryAt ?? failedAt.add(const Duration(hours: 1));

        if (!retryAt.isAfter(failedAt)) {
          retryAt = failedAt.add(const Duration(minutes: 1));
        }

        await _write(
          _blockedKey,
          retryAt.toUtc().toIso8601String(),
        );
      } else {
        await _write(
          failureKey,
          failedAt.add(const Duration(minutes: 15)).toIso8601String(),
        );
      }

      // Keep displaying real cached data if refreshing fails.
      if (cachedActivity != null) {
        return cachedActivity;
      }

      rethrow;
    }
  }

  Future<_FetchedActivity> _fetch(
    String owner,
    String repo,
  ) async {
    final now = DateTime.now().toUtc();

    final today = DateTime.utc(
      now.year,
      now.month,
      now.day,
    );

    final start = today.subtract(const Duration(days: 83));

    final days = List<int>.filled(84, 0);
    final loadedCommits = <GitHubCommit>[];
    final seen = <String>{};

    final client = http.Client();

    Future<List<dynamic>> fetchPage(
      Map<String, String> query,
    ) async {
      final response = await client.get(
        Uri.https(
          'api.github.com',
          '/repos/$owner/$repo/commits',
          query,
        ),
        headers: {
          'Accept': 'application/vnd.github+json',
        },
      ).timeout(const Duration(seconds: 20));

      // GitHub returns 409 for an empty repository.
      if (response.statusCode == 409) {
        return [];
      }

      if (response.statusCode != 200) {
        final remaining = response.headers['x-ratelimit-remaining'];

        final resetSeconds = int.tryParse(
          response.headers['x-ratelimit-reset'] ?? '',
        );

        final resetTime = resetSeconds == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                resetSeconds * 1000,
                isUtc: true,
              );

        final retryAfter = _parseRetryAfter(
          response.headers['retry-after'],
        );

        final rateLimited = response.statusCode == 429 ||
            (response.statusCode == 403 &&
                (remaining == '0' ||
                    response.body.toLowerCase().contains('rate limit')));

        if (rateLimited) {
          final candidates = [
            if (remaining == '0' && resetTime != null) resetTime,
            if (retryAfter != null) retryAfter,
          ];

          candidates.sort();

          throw GitHubActivityException(
            ActivityStatus.rateLimited,
            retryAt: candidates.isEmpty
                ? DateTime.now().toUtc().add(const Duration(hours: 1))
                : candidates.last.add(
                    const Duration(seconds: 5),
                  ),
          );
        }

        // 404 can mean inaccessible, private or nonexistent.
        // Do not assume that the repository is private.
        throw const GitHubActivityException(
          ActivityStatus.error,
        );
      }

      return jsonDecode(response.body) as List<dynamic>;
    }

    GitHubCommit parseCommit(dynamic item) {
      final commit = item['commit'] as Map<String, dynamic>;
      final committer = commit['committer'] as Map<String, dynamic>;

      return GitHubCommit(
        message: (commit['message'] as String).split('\n').first,
        sha: item['sha'] as String,
        url: item['html_url'] as String,
        date: DateTime.parse(
          committer['date'] as String,
        ).toUtc(),
      );
    }

    try {
      var page = 1;

      // Fetch every page to avoid displaying partial totals.
      while (true) {
        final items = await fetchPage({
          'since': start.toIso8601String(),
          'until': now.toIso8601String(),
          'per_page': '100',
          'page': '$page',
        });

        for (final item in items) {
          final commit = parseCommit(item);

          if (!seen.add(commit.sha)) {
            continue;
          }

          loadedCommits.add(commit);

          final date = commit.date;

          final day = DateTime.utc(
            date.year,
            date.month,
            date.day,
          );

          final index = day.difference(start).inDays;

          if (index >= 0 && index < days.length) {
            days[index]++;
          }
        }

        if (items.length < 100) {
          break;
        }

        page++;
      }

      // Include recent commits even for inactive repositories.
      if (loadedCommits.length < 3) {
        final recent = await fetchPage({
          'per_page': '3',
        });

        for (final item in recent) {
          final commit = parseCommit(item);

          if (seen.add(commit.sha)) {
            loadedCommits.add(commit);
          }
        }
      }

      loadedCommits.sort(
        (a, b) => b.date.compareTo(a.date),
      );

      return _FetchedActivity(
        windowStart: start,
        activity: GitHubActivity(
          days: List<int>.unmodifiable(days),
          lastCommit: loadedCommits.isEmpty ? null : loadedCommits.first.date,
          latestCommits: List<GitHubCommit>.unmodifiable(
            loadedCommits.take(3),
          ),
        ),
      );
    } finally {
      client.close();
    }
  }

  GitHubActivity _decodeActivity(
    Map<String, dynamic> json,
  ) {
    final savedDays =
        (json['days'] as List).map((value) => (value as num).toInt()).toList();

    if (savedDays.length != 84 || savedDays.any((count) => count < 0)) {
      throw const FormatException(
        'Invalid activity cache',
      );
    }

    final savedStart = DateTime.parse(
      json['windowStart'] as String,
    ).toUtc();

    final now = DateTime.now().toUtc();

    final today = DateTime.utc(
      now.year,
      now.month,
      now.day,
    );

    final currentStart = today.subtract(
      const Duration(days: 83),
    );

    final shift = currentStart.difference(savedStart).inDays;

    // Keep the graph aligned with the current UTC day.
    // New days remain zero until the next successful refresh.
    final days = List<int>.generate(84, (index) {
      final savedIndex = index + shift;

      if (savedIndex < 0 || savedIndex >= savedDays.length) {
        return 0;
      }

      return savedDays[savedIndex];
    });

    return GitHubActivity(
      days: List<int>.unmodifiable(days),
      lastCommit: json['lastCommit'] == null
          ? null
          : DateTime.parse(
              json['lastCommit'] as String,
            ).toUtc(),
      latestCommits: [
        for (final item in json['commits'] as List)
          GitHubCommit(
            message: item['message'] as String,
            sha: item['sha'] as String,
            url: item['url'] as String,
            date: DateTime.parse(
              item['date'] as String,
            ).toUtc(),
          ),
      ],
    );
  }

  DateTime? _parseRetryAfter(String? value) {
    if (value == null) {
      return null;
    }

    final seconds = int.tryParse(value);

    if (seconds == null) {
      return null;
    }

    return DateTime.now().toUtc().add(
          Duration(seconds: seconds),
        );
  }

  Future<String?> _read(String key) async {
    try {
      return await _storage.getString(key);
    } catch (_) {
      return null;
    }
  }

  Future<void> _write(
    String key,
    String value,
  ) async {
    try {
      await _storage.setString(key, value);
    } catch (_) {
      // Storage may be blocked or unavailable.
      // Fetched data can still be displayed.
    }
  }

  Future<void> _remove(String key) async {
    try {
      await _storage.remove(key);
    } catch (_) {}
  }
}

class _FetchedActivity {
  final DateTime windowStart;
  final GitHubActivity activity;

  const _FetchedActivity({
    required this.windowStart,
    required this.activity,
  });
}

class GitHubActivityException implements Exception {
  final ActivityStatus status;
  final DateTime? retryAt;

  const GitHubActivityException(
    this.status, {
    this.retryAt,
  });

  @override
  String toString() {
    return 'GitHub activity: ${status.name}'
        '${retryAt == null ? '' : ' — retry after $retryAt'}';
  }
}
