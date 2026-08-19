import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/section_label.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/core/utils/color_utils.dart';

class ProblemText extends StatelessWidget {
  final Project project;

  const ProblemText({
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          text: 'THE PROBLEM',
          color: ColorUtils.fromHex(project.hexcolor),
        ),
        const SizedBox(height: 20),
        Text(
          project.problemTitle,
          style: const TextStyle(
            fontSize: 42,
            height: 1.15,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.2,
          ),
        ),
        const SizedBox(height: 28),
        Text(
          project.problem,
          style: const TextStyle(
            fontSize: 17,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}
