import 'package:flutter/material.dart';
import 'package:ramajana05/features/home/data/domain/current_project.dart';

class ActivityStatusView extends StatelessWidget {
  final CurrentProject project;
  final Color accent;

  const ActivityStatusView({
    super.key,
    required this.project,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;
    final loading = project.activityStatus == ActivityStatus.loading;

    final title = switch (project.activityStatus) {
      ActivityStatus.loading => 'LOADING ACTIVITY',
      ActivityStatus.privateRepository => 'PRIVATE REPOSITORY',
      ActivityStatus.notCreated => 'COMING TO GITHUB',
      ActivityStatus.notConnected => 'NOT CONNECTED YET',
      ActivityStatus.rateLimited => 'TEMPORARILY UNAVAILABLE',
      ActivityStatus.error => 'ACTIVITY UNAVAILABLE',
      ActivityStatus.loaded => 'ACTIVITY LOADED',
    };

    final icon = switch (project.activityStatus) {
      ActivityStatus.privateRepository => Icons.lock_outline_rounded,
      ActivityStatus.notCreated => Icons.add_box_outlined,
      ActivityStatus.notConnected => Icons.link_off_rounded,
      ActivityStatus.rateLimited => Icons.schedule_rounded,
      ActivityStatus.error => Icons.cloud_off_rounded,
      _ => Icons.commit_rounded,
    };

    final retryAt = project.retryAt?.toLocal();

    final retryText = retryAt == null
        ? ''
        : ' Try again after '
            '${retryAt.hour.toString().padLeft(2, '0')}:'
            '${retryAt.minute.toString().padLeft(2, '0')} '
            'on ${retryAt.day.toString().padLeft(2, '0')}.'
            '${retryAt.month.toString().padLeft(2, '0')}.';

    final description = switch (project.activityStatus) {
      ActivityStatus.loading => 'Fetching the latest commits from GitHub.',
      ActivityStatus.privateRepository =>
        'Development happens in a private repository.',
      ActivityStatus.notCreated => 'The repository has not been created yet.',
      ActivityStatus.notConnected =>
        'Repository activity has not been connected yet.',
      ActivityStatus.rateLimited =>
        'GitHub’s request limit has been reached.$retryText',
      ActivityStatus.error => 'Could not load activity. The repository may be '
          'unreachable or require access.',
      ActivityStatus.loaded => '',
    };

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: accent.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (loading)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: accent,
                ),
              ),
            )
          else
            Icon(icon, color: accent, size: 23),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: accent,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.1,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    color: foreground.withValues(alpha: 0.6),
                    fontSize: 12,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
