import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/features/about/presentation/componets/tech_category.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  List<_TechCategoryData> _categories(BuildContext context) {
    return [
      _TechCategoryData(
        title: context.l10n.programming,
        items: [
          "Dart",
          "C#",
          "Java",
          "SQL",
          "Kotlin",
          "JavaScript",
        ],
      ),
      _TechCategoryData(
        title: context.l10n.frameworks,
        items: [
          "Flutter",
          "Unity",
          "Android SDK",
        ],
      ),
      _TechCategoryData(
        title: context.l10n.databases,
        items: [
          "MySQL",
          "SQLite",
          "PostgreSQL",
        ],
      ),
      _TechCategoryData(
        title: context.l10n.tools,
        items: [
          "GitHub",
          "VS Code",
          "Android Studio",
          "IntelliJ",
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.techStack,
            style: AppTextStyles.titleSmaller(context),
          ),
          const SizedBox(height: 10),
          ..._categories(context).map(
            (category) => Padding(
              padding: const EdgeInsets.only(
                bottom: 28,
              ),
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
