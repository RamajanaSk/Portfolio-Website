import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/hexcolor.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_cta/project_cta_background.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_cta/project_cta_content.dart';

class ProjectCTASection extends StatelessWidget {
  final Project project;
  final VoidCallback? onGithubPressed;
  final VoidCallback? onDemoPressed;

  const ProjectCTASection({
    super.key,
    required this.project,
    this.onGithubPressed,
    this.onDemoPressed,
  });

  @override
  Widget build(BuildContext context) {
    final accent = project.hexcolor.toColor();

    return SizedBox(
      width: double.infinity,
      height: 560,
      child: ProjectCtaBackground(
        projectName: project.name,
        accent: accent,
        child: ProjectCtaContent(
          accent: accent,
          onDemoPressed: onDemoPressed,
          onGithubPressed: onGithubPressed,
        ),
      ),
    );
  }
}
