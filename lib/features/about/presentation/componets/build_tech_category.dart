import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/features/about/presentation/componets/tech_category.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  static const List<_TechCategoryData> _categories = [
    _TechCategoryData(
      title: "PROGRAMMING",
      items: [
        "Dart",
        "C#",
        "Java",
        "SQL",
        "Kotlin",
        "JavaScript",
        "SQL",
      ],
    ),
    _TechCategoryData(
      title: "FRAMEWORKS",
      items: [
        "Flutter",
        "Unity",
        "Android SDK",
      ],
    ),
    _TechCategoryData(
      title: "DATABASES",
      items: [
        "MySQL",
        "SQLite",
        "PostgreSQL",
      ],
    ),
    _TechCategoryData(
      title: "TOOLS",
      items: [
        "GitHub",
        "VS Code",
        "Android Studio",
        "IntelliJ",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TECH STACK",
                style: AppTextStyles.titleSmaller(context),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ..._categories.map(
            (category) => Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: TechCategory(
                title: category.title,
                items: category.items,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechCategoryData {
  final String title;
  final List<String> items;

  const _TechCategoryData({
    required this.title,
    required this.items,
  });
}
