import 'package:flutter/material.dart';
import 'package:ramajana05/features/home/data/domain/current_project.dart';

class ProjectPreview extends StatelessWidget {
  final CurrentProject project;

  const ProjectPreview({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = theme.colorScheme.onSurface;
    final dark = theme.brightness == Brightness.dark;

    final accent =
        dark ? project.accent : Color.lerp(project.accent, Colors.black, 0.3)!;

    final placeholder = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accent.withValues(alpha: 0.16),
            accent.withValues(alpha: 0.025),
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                project.icon,
                size: 36,
                color: accent,
              ),
              const SizedBox(height: 12),
              Text(
                'PROJECT PREVIEW',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: foreground.withValues(alpha: 0.5),
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: project.previewAsset == null || project.previewAsset!.isEmpty
            ? placeholder
            : Image.asset(
                project.previewAsset!,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => placeholder,
              ),
      ),
    );
  }
}
