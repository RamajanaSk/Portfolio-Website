import 'package:flutter/material.dart';
import 'package:ramajana05/core/utils/color_utils.dart';

import 'package:ramajana05/core/widgets/image/project_image.dart';
import 'package:ramajana05/core/widgets/section_label.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/features/projects/presentation/widget/text/problem_text.dart';

class ProblemSection extends StatelessWidget {
  final bool isMobile;
  final Project project;

  const ProblemSection({
    super.key,
    required this.isMobile,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: isMobile ? 50 : 80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProblemText(
                    project: project,
                  ),
                  const SizedBox(height: 40),
                  ProjectImage(
                    imagePath: project.problemImage,
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: ProblemText(
                      project: project,
                    ),
                  ),
                  const SizedBox(width: 70),
                  Expanded(
                    flex: 5,
                    child: ProjectImage(
                      imagePath: project.problemImage,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
