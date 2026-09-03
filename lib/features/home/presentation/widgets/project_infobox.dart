import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';

class ProjectInfoBox extends StatelessWidget {
  final Project project;

  const ProjectInfoBox({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final technologies = project.technologies.take(5).toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: .45),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.onSurface.withValues(alpha: .07),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // =====================================================
          // PROJECT TYPE
          // =====================================================

          Row(
            children: [
              Container(
                width: 24,
                height: 2,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  project.typ.name.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),

          if (technologies.isNotEmpty) ...[
            const SizedBox(height: 16),

            // ===================================================
            // TECHNOLOGIES
            // ===================================================

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: technologies.map((tech) {
                return _TechnologyChip(
                  technology: tech,
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

// =============================================================
// TECHNOLOGY CHIP
// =============================================================

class _TechnologyChip extends StatelessWidget {
  final String technology;

  const _TechnologyChip({
    required this.technology,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: colorScheme.onSurface.withValues(alpha: .035),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.onSurface.withValues(alpha: .09),
        ),
      ),
      child: Text(
        technology,
        style: TextStyle(
          color: colorScheme.onSurface.withValues(alpha: .70),
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: .2,
        ),
      ),
    );
  }
}
