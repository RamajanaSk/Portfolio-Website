import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/hexcolor.dart';

import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/widgets/divider/normal_section_divider.dart';
import 'package:ramajana05/features/projects/presentation/section/about_project_section.dart';
import 'package:ramajana05/features/projects/presentation/section/hero_section.dart';

import 'package:ramajana05/features/projects/presentation/section/project_problem_and_experience_section.dart';
import 'package:ramajana05/features/projects/presentation/section/project_showcase_section.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;
  final VoidCallback onBack;

  const ProjectDetailScreen({
    super.key,
    required this.project,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(project: project),
            NormalSectionDivider(color: project.hexcolor.toColor()),
            AboutProjectSection(project: project),
            NormalSectionDivider(color: project.hexcolor.toColor()),
            const ProjectProblemAndExperienceSection(),
            NormalSectionDivider(color: project.hexcolor.toColor()),
            ProjectShowcaseSection(
              project: project,
            ),
            const SizedBox(height: 50),
            const NeonSectionDivider(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
