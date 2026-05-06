import 'package:flutter/material.dart';
import 'package:ramajana05/features/about/data/sources/education_data.dart';
import 'package:ramajana05/features/about/presentation/widget/componets/timeline_item.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "EDUCATION",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(height: 30),

          // ✅ dynamic list
          ...educations.map((e) => TimelineItem(
                date: e.date,
                title: e.degree, // 🔧 better than school as title
                subtitle: e.school, // 🔧 school instead of location
                description: e.description,
              )),
        ],
      ),
    );
  }
}
