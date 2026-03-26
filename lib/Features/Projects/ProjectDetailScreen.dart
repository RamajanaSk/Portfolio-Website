import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/widgets/neon_background_secetion.dart';

import 'package:ramajana05/features/Projects/project_overview_section.dart';
import 'package:ramajana05/features/Projects/section/project_about_section.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;
  final VoidCallback onBack;

  const ProjectDetailScreen(
      {super.key, required this.project, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight,
              child: Projectoverviewsection(project: project),
            ),
            NeonGradientSection(),
            ProjectAboutSection(project: project),
          ],
        ),
      ),
    );
  }
}
