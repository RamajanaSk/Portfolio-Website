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
    final uri = Uri.parse(repositoryUrl.trim());

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

    if (repo.isEmpty) {
      throw ArgumentError('Repository name must not be empty.');
    }

    final key = '$owner/$repo'.toLowerCase();

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
    // Version 6: all branches + issue creations.
    final cacheKey = 'github_activity_v6_$key';
    final failureKey = '${cacheKey}_retry_after';

    final now = DateTime.now().toUtc();

    GitHubActivity? cachedActivity;

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
        // Ignore invalid cache entries.
      }
    }

    // A recorded GitHub rate limit applies across repositories.
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

    // Avoid repeated requests after other failures.
    final failureRaw = await _read(failureKey);

    final retryAfter =
        failureRaw == null ? null : DateTime.tryParse(failureRaw)?.toUtc();

    if (retryAfter != null && now.isBefore(retryAfter)) {
      if (cachedActivity != null) {
        return cachedActivity;
      }

      throw GitHubActivityException(
        ActivityStatus.error,
        retryAt: retryAfter,
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

      // Continue displaying cached data if refreshing fails.
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

    // Combined daily activity: unique commits + issue creations.
    final days = List<int>.filled(84, 0);

    final loadedCommits = <GitHubCommit>[];
    final seenCommits = <String>{};
    final seenIssues = <int>{};

    final client = http.Client();

    Future<List<dynamic>> fetchPage(
      Map<String, String> query, {
      String endpoint = 'commits',
    }) async {
      final response = await client.get(
        Uri.https(
          'api.github.com',
          '/repos/$owner/$repo/$endpoint',
          query,
        ),
        headers: {
          'Accept': 'application/vnd.github+json',
        },
      ).timeout(const Duration(seconds: 20));

      // An empty repository can still contain issues.
      if (response.statusCode == 409 && endpoint == 'commits') {
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
                    retryAfter != null ||
                    response.body.toLowerCase().contains('rate limit')));

        if (rateLimited) {
          final candidates = <DateTime>[
            if (remaining == '0' && resetTime != null) resetTime,
            if (retryAfter != null) retryAfter,
          ];

          candidates.sort();

          throw GitHubActivityException(
            ActivityStatus.rateLimited,
            retryAt: candidates.isEmpty
                ? DateTime.now().toUtc().add(const Duration(hours: 1))
                : candidates.last.add(const Duration(seconds: 5)),
          );
        }

        // Inaccessible or missing repositories are not automatically private.
        throw const GitHubActivityException(
          ActivityStatus.error,
        );
      }

      return jsonDecode(response.body) as List<dynamic>;
    }

    void addActivity(DateTime date) {
      final utcDate = date.toUtc();

      if (utcDate.isBefore(start) || utcDate.isAfter(now)) {
        return;
      }

      final day = DateTime.utc(
        utcDate.year,
        utcDate.month,
        utcDate.day,
      );

      final index = day.difference(start).inDays;

      if (index >= 0 && index < days.length) {
        days[index]++;
      }
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
      // BRANCHES
      // Use HEAD SHAs to keep each branch's history stable while loading.
      final branchHeads = <String>{};
      var branchPage = 1;

      while (true) {
        final branches = await fetchPage(
          {
            'per_page': '100',
            'page': '$branchPage',
          },
          endpoint: 'branches',
        );

        for (final raw in branches) {
          final branch = raw as Map<String, dynamic>;
          final head = branch['commit'] as Map<String, dynamic>;

          // Identical branch heads only need to be fetched once.
          branchHeads.add(head['sha'] as String);
        }

        if (branches.length < 100) {
          break;
        }

        branchPage++;
      }

      // COMMITS FROM ALL BRANCHES
      for (final headSha in branchHeads) {
        var commitPage = 1;
        final branchCommits = <String>{};

        while (true) {
          final items = await fetchPage({
            'sha': headSha,
            'since': start.toIso8601String(),
            'until': now.toIso8601String(),
            'per_page': '100',
            'page': '$commitPage',
          });

          for (final item in items) {
            final commit = parseCommit(item);

            branchCommits.add(commit.sha);

            // A commit shared by multiple branches counts only once.
            if (!seenCommits.add(commit.sha)) {
              continue;
            }

            loadedCommits.add(commit);
            addActivity(commit.date);
          }

          if (items.length < 100) {
            break;
          }

          commitPage++;
        }

        // Include recent commits from inactive branches too.
        if (branchCommits.length < 3) {
          final recent = await fetchPage({
            'sha': headSha,
            'per_page': '3',
          });

          for (final item in recent) {
            final commit = parseCommit(item);

            if (!seenCommits.add(commit.sha)) {
              continue;
            }

            loadedCommits.add(commit);
            addActivity(commit.date);
          }
        }
      }

      // Latest commits across all branches.
      loadedCommits.sort(
        (a, b) => b.date.compareTo(a.date),
      );

      // ISSUE CREATIONS
      var issuePage = 1;

      while (true) {
        final items = await fetchPage(
          {
            'state': 'all',
            'sort': 'created',
            'direction': 'desc',
            'since': start.toIso8601String(),
            'per_page': '100',
            'page': '$issuePage',
          },
          endpoint: 'issues',
        );

        var reachedOlderIssues = false;

        for (final raw in items) {
          final item = raw as Map<String, dynamic>;

          final createdAt = DateTime.parse(
            item['created_at'] as String,
          ).toUtc();

          // Results are sorted by creation date, newest first.
          if (createdAt.isBefore(start)) {
            reachedOlderIssues = true;
            break;
          }

          // The issues endpoint also returns pull requests.
          if (item.containsKey('pull_request')) {
            continue;
          }

          final issueId = (item['id'] as num).toInt();

          if (!seenIssues.add(issueId)) {
            continue;
          }

          addActivity(createdAt);
        }

        if (reachedOlderIssues || items.length < 100) {
          break;
        }

        issuePage++;
      }

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
      throw const FormatException('Invalid activity cache');
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

    // Align cached values with the current UTC day.
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
      // Results can still be displayed if storage is unavailable.
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
