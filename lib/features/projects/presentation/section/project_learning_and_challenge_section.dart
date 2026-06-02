import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/features/projects/presentation/section/project_challenge_section.dart';
import 'package:ramajana05/features/projects/presentation/section/project_learning_section.dart';

class ProjectLearningAndChallengeSection extends StatelessWidget {
  final Project project;

  const ProjectLearningAndChallengeSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 32,
        vertical: isMobile ? 20 : 40,
      ),
      child: isMobile
          ? Column(
              children: [
                ProjectLearningsSection(
                  project: project,
                ),
                const SizedBox(height: 10),
                ProjectChallengesSection(
                  project: project,
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ProjectLearningsSection(
                    project: project,
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: ProjectChallengesSection(
                    project: project,
                  ),
                ),
              ],
            ),
    );
  }
}
