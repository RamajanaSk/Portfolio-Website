import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/widgets/project_carousel.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';
import 'package:ramajana05/data/dummyData.dart';
import 'package:ramajana05/features/about/presentation/sections/tech_stack_section.dart';
import 'package:ramajana05/features/projects/ProjectDetailScreen.dart';

class FeaturedWorkAndTechnologiesSection extends StatelessWidget {
  const FeaturedWorkAndTechnologiesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 900;

    final carouselFlex = screenWidth < 1200 ? 5 : 6;
    final techFlex = screenWidth < 1200 ? 4 : 3;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeaderText(
            context.l10n.featuredProjects,
          ),

          SizedBox(height: isMobile ? 40 : 60),

          // MOBILE
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ProjectCarousel(
                    projects: getDummyProjects(context),
                    onProjectTap: (project) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProjectDetailScreen(
                            project: project,
                            onBack: () {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 50),
                const SizedBox(
                  width: double.infinity,
                  child: TechStackSection(),
                ),
              ],
            )

          // DESKTOP / TABLET
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: carouselFlex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    constraints: BoxConstraints(
                      maxWidth: screenWidth * 0.55,
                    ),
                    child: ProjectCarousel(
                      projects: getDummyProjects(context),
                      onProjectTap: (project) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProjectDetailScreen(
                              project: project,
                              onBack: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: screenWidth < 1200 ? 30 : 50),
                Expanded(
                  flex: techFlex,
                  child: const TechStackSection(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
