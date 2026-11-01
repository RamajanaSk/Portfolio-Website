import 'package:flutter/material.dart';
import 'package:ramajana05/features/home/data/domain/current_project.dart';
import 'package:ramajana05/features/home/presentation/widgets/activity_status_view.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ramajana05/features/home/presentation/widgets/currently/activity_heatmap.dart';

class ProjectActivity extends StatelessWidget {
  final CurrentProject project;
  final Color accent;

  const ProjectActivity({
    super.key,
    required this.project,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    if (project.activityStatus != ActivityStatus.loaded) {
      return ActivityStatusView(
        project: project,
        accent: accent,
      );
    }

    // Dein bisheriger Code mit Heatmap und Latest Commits
    // bleibt ab hier bestehen.
    final foreground = Theme.of(context).colorScheme.onSurface;

    final labelStyle = TextStyle(
      color: foreground.withValues(alpha: 0.5),
      fontSize: 9,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.2,
    );

    final total = project.dailyCommits?.fold<int>(
      0,
      (sum, count) => sum + count,
    );

    final heatmap = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('REPOSITORY ACTIVITY', style: labelStyle),
        const SizedBox(height: 12),
        ActivityHeatmap(
          dailyCommits: project.dailyCommits,
          accent: accent,
        ),
        const SizedBox(height: 9),
        Text(
          total == null
              ? 'Activity unavailable'
              : 'Last 84 days · $total commits',
          style: TextStyle(
            color: foreground.withValues(alpha: 0.45),
            fontSize: 10,
            height: 1.6,
          ),
        ),
      ],
    );

    final commits = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('LATEST COMMITS', style: labelStyle),
        const SizedBox(height: 8),
        if (project.latestCommits.isEmpty)
          Text(
            'No commits loaded',
            style: TextStyle(
              color: foreground.withValues(alpha: 0.4),
              fontSize: 11,
              height: 1.6,
            ),
          ),
        for (final commit in project.latestCommits.take(3))
          _CommitTile(
            commit: commit,
            accent: accent,
          ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 460) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              heatmap,
              const SizedBox(height: 22),
              commits,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 175,
              child: heatmap,
            ),
            const SizedBox(width: 24),
            Expanded(child: commits),
          ],
        );
      },
    );
  }
}

class _CommitTile extends StatelessWidget {
  final GitHubCommit commit;
  final Color accent;

  const _CommitTile({
    required this.commit,
    required this.accent,
  });

  Future<void> _open(BuildContext context) async {
    try {
      final uri = Uri.parse(commit.url);

      if (uri.scheme != 'https' || uri.host != 'github.com') {
        throw Exception('Invalid GitHub URL');
      }

      final opened = await launchUrl(
        uri,
        webOnlyWindowName: '_blank',
      );

      if (!opened) throw Exception('Could not open commit');
    } catch (_) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open the GitHub link.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;
    final date = commit.date.toUtc();
    final dateText = '${date.day.toString().padLeft(2, '0')}.'
        '${date.month.toString().padLeft(2, '0')}.'
        '${date.year}';

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: TextButton(
        onPressed: () => _open(context),
        style: TextButton.styleFrom(
          foregroundColor: foreground,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 9,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                Icons.commit_rounded,
                color: accent,
                size: 16,
              ),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    commit.message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${commit.shortSha} · $dateText',
                    style: TextStyle(
                      color: foreground.withValues(alpha: 0.4),
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.arrow_outward_rounded,
              size: 13,
              color: accent,
            ),
          ],
        ),
      ),
    );
  }
}
