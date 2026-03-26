import 'package:flutter/material.dart';
import 'package:ramajana05/features/about/presentation/widget/sections/tech_category_section.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Column(
      // ✅ THIS WAS MISSING
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔥 TITLE
        Text(
          "TECH STACK",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),

        const SizedBox(height: 30),

        const TechCategory(
          title: "PROGRAMMING",
          items: ["Dart", "Kotlin", "Java", "C#", "JavaScript", "SQL"],
        ),

        const TechCategory(
          title: "FRAMEWORKS",
          items: ["Flutter", "Unity", "Android SDK"],
        ),

        const TechCategory(
          title: "DATABASES",
          items: ["MySQL", "SQLite", "PostgreSQL"],
        ),

        const TechCategory(
          title: "TOOLS",
          items: ["GitHub", "VS Code", "Android Studio", "IntelliJ"],
        ),

        const TechCategory(
          title: "METHODS",
          items: ["Clean Code", "Agile", "Design Thinking"],
        ),
      ],
    );
  }
}
