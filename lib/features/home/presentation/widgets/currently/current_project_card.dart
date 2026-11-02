import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ramajana05/features/home/data/domain/current_project.dart';
import 'package:ramajana05/features/home/presentation/widgets/currently/project_activity.dart';
import 'package:ramajana05/features/home/presentation/widgets/currently/project_preview.dart';

class CurrentProjectCard extends StatelessWidget {
  final CurrentProject project;

  const CurrentProjectCard({
    super.key,
    required this.project,
  });

  // ============================================================
  // NAVIGATION
  // ============================================================

  void _openProject(BuildContext context) {
    if (project.onOpen != null) {
      project.onOpen!();
      return;
    }

    final slug =
        project.title.toLowerCase().trim().replaceAll(RegExp(r'\s+'), '-');

    context.go('/projects/$slug');
  }

  // ============================================================
  // DATE FORMAT
  // ============================================================

  String _date(DateTime? value) {
    if (value == null) return 'Not added';

    return '${value.day.toString().padLeft(2, '0')}.'
        '${value.month.toString().padLeft(2, '0')}.'
        '${value.year}';
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final foreground = theme.colorScheme.onSurface;

    final accent =
        dark ? project.accent : Color.lerp(project.accent, Colors.black, 0.3)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 700;
        final padding = mobile ? 18.0 : 32.0;

        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: dark ? const Color(0xFF111114) : theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: foreground.withValues(alpha: 0.10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ==================================================
              // PROJECT HEADER
              // ==================================================

              Padding(
                padding: EdgeInsets.all(padding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PROJECT ICON
                    Container(
                      width: mobile ? 44 : 58,
                      height: mobile ? 44 : 58,
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: 0.09),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: accent.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Icon(
                        project.icon,
                        color: accent,
                        size: mobile ? 24 : 30,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CATEGORY
                          Text(
                            project.category.toUpperCase(),
                            style: TextStyle(
                              color: accent,
                              fontSize: mobile ? 10 : 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 7),

                          // CLICKABLE PROJECT TITLE
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => _openProject(context),
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(6),
                              hoverColor: accent.withValues(alpha: 0.05),
                              splashColor: accent.withValues(alpha: 0.08),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      project.title,
                                      style: TextStyle(
                                        color: foreground,
                                        fontSize: mobile ? 25 : 38,
                                        fontWeight: FontWeight.w900,
                                        height: 1.15,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Icon(
                                    Icons.arrow_outward_rounded,
                                    color: accent,
                                    size: mobile ? 20 : 26,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // LARGE PROJECT PREVIEW
              // ==================================================

              ProjectPreview(project: project),

              // ==================================================
              // PROJECT DETAILS
              // ==================================================

              Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // DESCRIPTION
                    Text(
                      project.description,
                      style: TextStyle(
                        color: foreground.withValues(alpha: 0.7),
                        fontSize: mobile ? 14 : 17,
                        height: 1.75,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // DATES
                    Wrap(
                      spacing: 40,
                      runSpacing: 16,
                      children: [
                        _DateLabel(
                          label: 'STARTED',
                          value: _date(project.startedAt),
                        ),
                        _DateLabel(
                          label: 'LAST UPDATE',
                          value: _date(project.lastUpdatedAt),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    Divider(
                      height: 1,
                      color: foreground.withValues(alpha: 0.10),
                    ),

                    const SizedBox(height: 24),

                    // ==================================================
                    // GITHUB ACTIVITY / COMMITS
                    // ==================================================

                    ProjectActivity(
                      project: project,
                      accent: accent,
                    ),

                    // ==================================================
                    // COMPLETED MILESTONES
                    // ==================================================

                    if (project.completedMilestones.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      for (final milestone in project.completedMilestones)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check_rounded,
                                size: 19,
                                color: accent,
                              ),
                              const SizedBox(width: 9),
                              Expanded(
                                child: Text(
                                  milestone,
                                  style: TextStyle(
                                    color: foreground.withValues(
                                      alpha: 0.75,
                                    ),
                                    fontSize: 13,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],

                    // ==================================================
                    // NEXT STEP
                    // ==================================================

                    if (project.nextStep != null) ...[
                      const SizedBox(height: 16),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'NEXT / ',
                              style: TextStyle(
                                color: accent,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(
                              text: project.nextStep,
                            ),
                          ],
                        ),
                        style: TextStyle(
                          color: foreground.withValues(
                            alpha: 0.65,
                          ),
                          fontSize: 13,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ============================================================
// DATE LABEL
// ============================================================

class _DateLabel extends StatelessWidget {
  final String label;
  final String value;

  const _DateLabel({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: foreground.withValues(alpha: 0.45),
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          value,
          style: TextStyle(
            color: foreground.withValues(alpha: 0.85),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
