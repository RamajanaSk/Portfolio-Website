import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/widgets/text/eyebrow_text.dart';

import 'package:ramajana05/data/dummyData.dart';
import 'package:ramajana05/data/models/project.dart';

import 'package:ramajana05/features/about/presentation/sections/tech_stack_section.dart';

import 'package:ramajana05/features/home/presentation/widgets/featured_work/expandable_project_panel.dart';
import 'package:ramajana05/features/home/presentation/widgets/featured_work/featured_project_list.dart';
import 'package:ramajana05/features/home/presentation/widgets/featured_work/size_observer.dart';
import 'package:ramajana05/features/home/presentation/widgets/featured_work/work_panel.dart';

class FeaturedWorkAndTechnologiesSection extends StatefulWidget {
  const FeaturedWorkAndTechnologiesSection({
    super.key,
  });

  @override
  State<FeaturedWorkAndTechnologiesSection> createState() =>
      _FeaturedWorkAndTechnologiesSectionState();
}

class _FeaturedWorkAndTechnologiesSectionState
    extends State<FeaturedWorkAndTechnologiesSection> {
  // ============================================================
  // COLORS
  // ============================================================

  static const _pink = Color(0xFFFF299D);
  static const _cyan = Color(0xFF08BCEB);

  // ============================================================
  // FEATURED PROJECTS
  // ============================================================

  static const _featuredNames = [
    'Edge Traffic Analysis',
    'Quotey',
    'Traveler',
  ];

  double? _toolkitHeight;

  List<Project> _getFeaturedProjects(List<Project> projects) {
    final selected = <Project>[];

    // Select preferred featured projects
    for (final name in _featuredNames) {
      for (final project in projects) {
        if (project.name.toLowerCase() == name.toLowerCase() &&
            !selected.contains(project)) {
          selected.add(project);
          break;
        }
      }
    }

    // Fill remaining slots with other projects
    for (final project in projects) {
      if (selected.length >= 3) break;

      if (!selected.contains(project)) {
        selected.add(project);
      }
    }

    return selected.take(3).toList();
  }

  // ============================================================
  // PROJECT NAVIGATION
  // ============================================================

  void _openProject(BuildContext context, Project project) {
    final slug =
        project.name.toLowerCase().trim().replaceAll(RegExp(r'\s+'), '-');

    context.go('/projects/$slug');
  }

  // ============================================================
  // TOOLKIT HEIGHT
  // ============================================================

  void _onToolkitSizeChanged(Size size) {
    if (!mounted) return;

    if (_toolkitHeight == null || (_toolkitHeight! - size.height).abs() > 0.5) {
      setState(() {
        _toolkitHeight = size.height;
      });
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final projects = _getFeaturedProjects(
      getDummyProjects(context).cast<Project>(),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 20 : 32,
            vertical: mobile ? 36 : 64,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1440,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ==================================================
                  // SECTION HEADER
                  // ==================================================

                  EyebrowText(
                    number: '03',
                    text: context.l10n.featuredProjects.toUpperCase(),
                  ),

                  const SizedBox(height: 28),

                  // ==================================================
                  // FEATURED WORK + TOOLKIT
                  // ==================================================

                  LayoutBuilder(
                    builder: (context, inner) {
                      final stacked = inner.maxWidth < 1000;

                      // ----------------------------------------------
                      // FEATURED PROJECT PANEL
                      // ----------------------------------------------

                      final projectPanel = WorkPanel(
                        number: '01',
                        title: 'SELECTED WORK',
                        subtitle: 'Explore the ideas behind the interfaces.',
                        icon: Icons.layers_outlined,
                        accent: _pink,
                        child: FeaturedProjectsList(
                          projects: projects,
                          onProjectTap: (project) =>
                              _openProject(context, project),
                        ),
                      );

                      // ----------------------------------------------
                      // TECHNOLOGY PANEL
                      // ----------------------------------------------

                      const toolkitPanel = WorkPanel(
                        number: '02',
                        title: 'THE TOOLKIT',
                        subtitle: 'Tools I use to bring ideas to life.',
                        icon: Icons.terminal_rounded,
                        accent: _cyan,
                        child: TechStackSection(),
                      );

                      // ----------------------------------------------
                      // MOBILE / TABLET LAYOUT
                      // ----------------------------------------------

                      if (stacked) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            projectPanel,
                            const SizedBox(height: 18),
                            toolkitPanel,
                          ],
                        );
                      }

                      // ----------------------------------------------
                      // DESKTOP LAYOUT
                      // ----------------------------------------------

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // FEATURED PROJECTS
                          Expanded(
                            flex: 6,
                            child: ExpandableProjectPanel(
                              toolkitHeight: _toolkitHeight,
                              projects: projects,
                              onProjectTap: (project) =>
                                  _openProject(context, project),
                            ),
                          ),

                          const SizedBox(width: 18),

                          // TECHNOLOGY STACK
                          Expanded(
                            flex: 4,
                            child: SizeObserver(
                              onSizeChanged: _onToolkitSizeChanged,
                              child: toolkitPanel,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
