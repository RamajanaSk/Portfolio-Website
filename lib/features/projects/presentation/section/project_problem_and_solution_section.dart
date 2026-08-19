import 'package:flutter/material.dart';

import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/features/projects/presentation/section/problem_section.dart';
import 'package:ramajana05/features/projects/presentation/section/solution_section.dart';

class ProjectProblemAndSolutionSection extends StatelessWidget {
  final Project project;

  const ProjectProblemAndSolutionSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 850;

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ProblemSection(
            isMobile: isMobile,
            project: project,
          ),
          SolutionSection(
            isMobile: isMobile,
            project: project,
          ),
        ],
      ),
    );
  }
}
