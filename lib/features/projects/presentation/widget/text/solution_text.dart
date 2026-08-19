import 'package:flutter/material.dart';

import 'package:ramajana05/core/widgets/section_label.dart';

class SolutionText extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const SolutionText({
    super.key,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          text: 'THE SOLUTION',
          color: color,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 42,
            height: 1.15,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.2,
          ),
        ),
        const SizedBox(height: 28),
        Text(
          description,
          style: const TextStyle(
            fontSize: 17,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}
