import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/section_label.dart';

class ExperienceText extends StatelessWidget {
  const ExperienceText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          text: "The Experience",
          color: Colors.orange,
        ),
        SizedBox(height: 20),
        Text(
          "Explore. Discover. Earn.",
          style: TextStyle(
            fontSize: 42,
            height: 1.15,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.2,
          ),
        ),
        SizedBox(height: 24),
        Text(
          "Walk around, discover places within your\n"
          "radius and earn XP. Level up, complete\n"
          "quests and become the ultimate explorer.",
          style: TextStyle(
            fontSize: 17,
            height: 1.7,
          ),
        ),
        SizedBox(height: 35),
        _FeatureItem(
          text: "Real time map & discovery radius",
        ),
        _FeatureItem(
          text: "Gamified XP & level system",
        ),
        _FeatureItem(
          text: "Quests & daily challenges",
        ),
        _FeatureItem(
          text: "Detailed place information",
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String text;

  const _FeatureItem({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Color(0xFFD9F3E7),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              size: 16,
              color: Color(0xFF25A66A),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
