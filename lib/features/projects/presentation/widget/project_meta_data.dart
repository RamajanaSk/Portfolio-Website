import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/hexcolor.dart';
import 'package:ramajana05/data/models/project.dart';

class ProjectMetaData extends StatelessWidget {
  final Project project;

  const ProjectMetaData({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final accent = project.hexcolor.toColor();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Release status
        if (project.isPublished)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: accent.withValues(alpha: 0.5),
                      blurRadius: 7,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 9),
              Text(
                'LIVE ON GOOGLE PLAY',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.65),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),

        const SizedBox(height: 24),

        Wrap(
          spacing: 42,
          runSpacing: 22,
          children: [
            _MetaItem(
              label: 'RELEASE',
              value: 'SEP 2026',
              accent: accent,
            ),
            _MetaItem(
              label: 'PLATFORM',
              value: project.platform ?? 'ANDROID',
              accent: accent,
            ),
            _MetaItem(
              label: 'VERSION',
              value: project.version ?? '1.0.0',
              accent: accent,
            ),
          ],
        ),
      ],
    );
  }
}

class _MetaItem extends StatelessWidget {
  final String label;
  final String value;
  final Color accent;

  const _MetaItem({
    required this.label,
    required this.value,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.35),
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
