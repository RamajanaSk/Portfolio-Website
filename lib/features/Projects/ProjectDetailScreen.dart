import 'package:flutter/material.dart';

import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';

import 'package:ramajana05/features/projects/presentation/section/project_about_section.dart';
import 'package:ramajana05/features/projects/presentation/section/project_learning_and_challenge_section.dart';
import 'package:ramajana05/features/projects/presentation/section/project_overview_section.dart';
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
            Projectoverviewsection(project: project),
            const NeonSectionDivider(),
            ProjectAboutSection(
              project: project,
            ),
            ProjectShowcaseSection(
              project: project,
            ),
            ProjectLearningAndChallengeSection(
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
