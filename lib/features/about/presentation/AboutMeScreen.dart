import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/widgets/cards/project_card.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/divider/normal_section_divider.dart';
import 'package:ramajana05/core/widgets/footer.dart';

import 'package:ramajana05/core/widgets/metric_item.dart';
import 'package:ramajana05/core/widgets/project_carousel.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';

import 'package:ramajana05/features/about/presentation/componets/build_tech_category.dart';
import 'package:ramajana05/features/about/presentation/sections/about_me_section.dart';
import 'package:ramajana05/features/about/presentation/sections/education_section.dart';
import 'package:ramajana05/features/about/presentation/sections/experience_section.dart';
import 'package:ramajana05/Data/dummyData.dart';
import 'package:ramajana05/features/projects/ProjectDetailScreen.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeaderText("GET TO KNOW ME"),
                const SizedBox(height: 20),
                const AboutMeSection(),
                const SizedBox(height: 40),
                const SectionHeaderText("Featured Work & Technologies"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ProjectCarousel(
                        projects: dummyProjects,
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
                    const SizedBox(width: 40),
                    const Expanded(
                      flex: 1,
                      child: TechStackSection(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MetricItem(value: "2.5+", label: "Years"),
              MetricItem(value: "10+", label: "Projects"),
              MetricItem(value: "Flutter", label: "Focus"),
            ],
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ExperienceSection()),
                  SizedBox(width: 80),
                  Expanded(child: EducationSection()),
                ],
              ),
            ),
          ),
          const SizedBox(height: 80),
          const NeonSectionDivider(),
          const Footer(),
        ],
      ),
    );
  }
}
