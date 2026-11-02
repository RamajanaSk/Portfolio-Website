import 'package:flutter/material.dart';

import 'package:ramajana05/core/controller/home_scroll_controller.dart';
import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/responsive.dart/responsive_layout.dart';
import 'package:ramajana05/data/dummyData.dart';

import 'package:ramajana05/features/about/presentation/sections/featured_work_and_technologies_section.dart';
import 'package:ramajana05/features/home/data/domain/current_project.dart';
import 'package:ramajana05/features/home/presentation/sections/about_me_small_section.dart';
import 'package:ramajana05/features/home/presentation/sections/github_currently_section.dart';
import 'package:ramajana05/features/home/presentation/sections/home_currently_section.dart';
import 'package:ramajana05/features/home/presentation/sections/home_expertise_section.dart';
import 'package:ramajana05/features/home/presentation/sections/start_section.dart';
import 'package:ramajana05/features/home/presentation/sections/home_cta_section.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_Image_grid.dart';

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
  final project = Project(
    previewPicture: 'images/traveler/traveler_main.png',
    mockupPicture: 'images/forest/forest_main.png',
    logoPicture: 'images/traveler/logo.png',
  );

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
      body: SingleChildScrollView(
        controller: HomeScrollController.controller,
        child: Column(
          children: [
            // 01 — Deinen bisherigen responsiven Start beibehalten.
            ResponsiveLayout(
              mobile: const StartSection(),
              desktop: SizedBox(
                width: double.infinity,
                height: (screenHeight * 0.72).clamp(560.0, 680.0),
                child: const StartSection(),
              ),
              largeDesktop: SizedBox(
                width: double.infinity,
                height: screenHeight,
                child: const StartSection(),
              ),
            ),

            const NeonSectionDivider(),
            GitHubCurrentlySection(
              projects: [
                CurrentProject(
                  title: edgeProject.name,
                  category: edgeProject.universityContext ?? 'Research project',
                  description: edgeProject.shortDescription,
                  icon: Icons.radar_rounded,
                  accent: Color(
                    int.parse(
                          (edgeProject.hexcolor ?? '#08BCEB')
                              .replaceFirst('#', ''),
                          radix: 16,
                        ) |
                        0xFF000000,
                  ),
                  repositoryUrl: (edgeProject.githubUrl ?? '').trim().isEmpty
                      ? null
                      : edgeProject.githubUrl,
                ),
                CurrentProject(
                  title: securityProject.name,
                  category: securityProject.universityContext ??
                      'Independent venture',
                  description: securityProject.shortDescription,
                  icon: Icons.hub_outlined,
                  accent: Color(
                    int.parse(
                          (securityProject.hexcolor ?? '#FF299D')
                              .replaceFirst('#', ''),
                          radix: 16,
                        ) |
                        0xFF000000,
                  ),
                  repositoryUrl:
                      (securityProject.githubUrl ?? '').trim().isEmpty
                          ? null
                          : securityProject.githubUrl,
                ),
              ],
            ),
            const NeonSectionDivider(),

            // 03 — Ausgewählte Projekte und Technologien.
            const FeaturedWorkAndTechnologiesSection(),

            // 04 — Deine Fähigkeiten.
            const HomeExpertiseSection(),

            // 05 — Persönlicher Einblick.
            AboutMeSmallSection(
              onAboutMePressed: widget.onAboutMePressed,
            ),

            const NeonSectionDivider(),

            // 06 — Kontakt.
            const HomeCTASection(),
            const NeonSectionDivider(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
