import 'package:flutter/material.dart';
import 'package:ramajana05/features/about/data/sources/experience_data.dart';
import 'package:ramajana05/features/about/presentation/componets/timeline_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "EXPERIENCE",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(height: 30),
          ...experiences.map((e) => TimelineItem(
                date: e.date,
                title: e.title,
                subtitle: e.company,
                description: e.description,
              )),
        ],
      ),
    );
  }
}
