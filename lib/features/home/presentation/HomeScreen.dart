import 'package:flutter/material.dart';

import 'package:ramajana05/core/controller/home_scroll_controller.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/navigation/section_navigation_item.dart';
import 'package:ramajana05/core/widgets/responsive.dart/responsive_layout.dart';

import 'package:ramajana05/data/dummyData.dart';

import 'package:ramajana05/features/home/data/domain/current_project.dart';
import 'package:ramajana05/features/home/presentation/sections/featured_work_and_technologies_section.dart';
import 'package:ramajana05/features/home/presentation/sections/about_me_small_section.dart';
import 'package:ramajana05/features/home/presentation/sections/github_currently_section.dart';
import 'package:ramajana05/features/home/presentation/sections/home_expertise_section.dart';
import 'package:ramajana05/features/home/presentation/sections/start_section.dart';
import 'package:ramajana05/features/home/presentation/sections/home_cta_section.dart';

class Homescreen extends StatefulWidget {
  final String title;
  final VoidCallback onAboutMePressed;

  const Homescreen({
    super.key,
    required this.title,
    required this.onAboutMePressed,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  static const _purple = Color(0xFFAD8BF5);
  static const _green = Color(0xFF55CBA3);
  static const _orange = Color(0xFFE5AD66);

  final List<GlobalKey> _sectionKeys = List.generate(
    6,
    (_) => GlobalKey(),
  );

  int _activeIndex = 0;
  bool _isNavigating = false;

  ScrollController get _scrollController => HomeScrollController.controller;

  List<SectionNavigationItem> get _sections => [
        SectionNavigationItem(
          number: '01',
          label: 'Introduction',
          key: _sectionKeys[0],
          color: AppColors.pink,
        ),
        SectionNavigationItem(
          number: '02',
          label: 'Featured Work',
          key: _sectionKeys[1],
          color: AppColors.blue,
        ),
        SectionNavigationItem(
          number: '03',
          label: 'Currently Building',
          key: _sectionKeys[2],
          color: _purple,
        ),
        SectionNavigationItem(
          number: '04',
          label: 'Expertise',
          key: _sectionKeys[3],
          color: _green,
        ),
        SectionNavigationItem(
          number: '05',
          label: 'About',
          key: _sectionKeys[4],
          color: _orange,
        ),
        SectionNavigationItem(
          number: '06',
          label: 'Contact',
          key: _sectionKeys[5],
          color: AppColors.blue,
        ),
      ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateActiveSection);
  }

  void _updateActiveSection() {
    if (!mounted || _isNavigating) return;

    final viewportHeight = MediaQuery.sizeOf(context).height;
    final targetY = viewportHeight * 0.25;

    int nearestIndex = 0;
    double nearestDistance = double.infinity;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final sectionContext = _sectionKeys[i].currentContext;
      if (sectionContext == null) continue;

      final renderObject = sectionContext.findRenderObject();

      if (renderObject is! RenderBox ||
          !renderObject.attached ||
          !renderObject.hasSize) {
        continue;
      }

      final position = renderObject.localToGlobal(Offset.zero);
      final distance = (position.dy - targetY).abs();

      if (distance < nearestDistance) {
        nearestDistance = distance;
        nearestIndex = i;
      }
    }

    if (nearestIndex != _activeIndex) {
      setState(() {
        _activeIndex = nearestIndex;
      });
    }
  }

  Future<void> _scrollToSection(int index) async {
    if (index < 0 || index >= _sectionKeys.length) return;

    final targetContext = _sectionKeys[index].currentContext;
    if (targetContext == null) return;

    setState(() {
      _activeIndex = index;
      _isNavigating = true;
    });

    try {
      await Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
        alignment: 0.02,
      );
    } finally {
      if (mounted) {
        _isNavigating = false;
        _updateActiveSection();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateActiveSection);
    super.dispose();
  }

  Widget _section(int index, Widget child) {
    return KeyedSubtree(
      key: _sectionKeys[index],
      child: child,
    );
  }

  Color _projectColor(String? hex, Color fallback) {
    final value = hex?.replaceFirst('#', '').trim();

    if (value == null || value.isEmpty) {
      return fallback;
    }

    final parsed = int.tryParse(value, radix: 16);

    if (parsed == null) return fallback;

    return Color(
      value.length == 8 ? parsed : (parsed | 0xFF000000),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final projects = getDummyProjects(context);

    final edgeProject = projects.firstWhere(
      (project) => project.id == 'edge-traffic-analysis',
    );

    final securityProject = projects.firstWhere(
      (project) => project.id == 'security-platform',
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final showNavigation = constraints.maxWidth >= 900;

          return Stack(
            children: [
              // ================================================
              // MAIN SCROLL CONTENT
              // ================================================

              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 01 — START
                    _section(
                      0,
                      ResponsiveLayout(
                        mobile: StartSection(
                          onAboutMePressed: () {
                            final aboutContext = _sectionKeys[4].currentContext;

                            if (aboutContext == null) return;

                            Scrollable.ensureVisible(
                              aboutContext,
                              duration: const Duration(milliseconds: 650),
                              curve: Curves.easeInOutCubic,
                              alignment: 0.05,
                            );
                          },
                        ),
                        desktop: SizedBox(
                          width: double.infinity,
                          height: (screenHeight * 0.72).clamp(560.0, 680.0),
                          child: StartSection(
                            onAboutMePressed: () {
                              final aboutContext =
                                  _sectionKeys[4].currentContext;

                              if (aboutContext == null) return;

                              Scrollable.ensureVisible(
                                aboutContext,
                                duration: const Duration(milliseconds: 650),
                                curve: Curves.easeInOutCubic,
                                alignment: 0.05,
                              );
                            },
                          ),
                        ),
                        largeDesktop: SizedBox(
                          width: double.infinity,
                          height: screenHeight,
                          child: StartSection(
                            onAboutMePressed: () {
                              final aboutContext =
                                  _sectionKeys[4].currentContext;

                              if (aboutContext == null) return;

                              Scrollable.ensureVisible(
                                aboutContext,
                                duration: const Duration(milliseconds: 650),
                                curve: Curves.easeInOutCubic,
                                alignment: 0.05,
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const NeonSectionDivider(),

                    // 02 — CURRENTLY BUILDING
                    _section(
                      1,
                      GitHubCurrentlySection(
                        projects: [
                          CurrentProject(
                            title: securityProject.name,
                            startedAt: securityProject.startDate,
                            previewAsset: securityProject.bannerPreviewPicture,
                            category: securityProject.universityContext ??
                                'Independent venture',
                            description: securityProject.shortDescription,
                            icon: Icons.hub_outlined,
                            accent: _projectColor(
                                securityProject.hexcolor, AppColors.pink),
                            repositoryUrl:
                                (securityProject.githubUrl ?? '').trim().isEmpty
                                    ? null
                                    : securityProject.githubUrl,
                          ),
                          CurrentProject(
                            title: edgeProject.name,
                            startedAt: edgeProject.startDate,
                            previewAsset: edgeProject.bannerPreviewPicture,
                            category: edgeProject.universityContext ??
                                'Research project',
                            description: edgeProject.shortDescription,
                            icon: Icons.radar_rounded,
                            accent: _projectColor(
                              edgeProject.hexcolor,
                              AppColors.blue,
                            ),
                            repositoryUrl:
                                (edgeProject.githubUrl ?? '').trim().isEmpty
                                    ? null
                                    : edgeProject.githubUrl,
                          ),
                        ],
                      ),
                    ),

                    const NeonSectionDivider(),

                    // 03 — FEATURED WORK
                    _section(
                      2,
                      const FeaturedWorkAndTechnologiesSection(),
                    ),

                    // 04 — EXPERTISE
                    _section(
                      3,
                      const HomeExpertiseSection(),
                    ),

                    // 05 — ABOUT ME
                    _section(
                      4,
                      AboutMeSmallSection(
                        onAboutMePressed: widget.onAboutMePressed,
                      ),
                    ),

                    const NeonSectionDivider(),

                    // 06 — CONTACT
                    _section(
                      5,
                      const HomeCTASection(),
                    ),

                    const NeonSectionDivider(),
                    const Footer(),
                  ],
                ),
              ),

              // ================================================
              // FLOATING SECTION NAVIGATION
              // ================================================

              if (showNavigation)
                Positioned(
                  right: 12,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: SectionScrollNavigation(
                      sections: _sections,
                      activeIndex: _activeIndex,
                      onSelected: _scrollToSection,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
