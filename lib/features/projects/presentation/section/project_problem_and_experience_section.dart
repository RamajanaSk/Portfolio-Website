import 'package:flutter/material.dart';

import 'package:ramajana05/features/projects/presentation/section/experience_section.dart';
import 'package:ramajana05/features/projects/presentation/section/problem_section.dart';

class ProjectProblemAndExperienceSection extends StatelessWidget {
  const ProjectProblemAndExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 850;

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ProblemSection(isMobile: isMobile),
          ExperienceSection(isMobile: isMobile),
        ],
      ),
    );
  }
}
