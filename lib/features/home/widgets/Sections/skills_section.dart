import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TECH STACK",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(height: 40),
          _buildCategory(
            context,
            "PROGRAMMING",
            ["Dart", "Kotlin", "Java", "C#", "JavaScript", "SQL"],
          ),
          _buildCategory(
            context,
            "FRAMEWORKS",
            ["Flutter", "Unity", "Android SDK"],
          ),
          _buildCategory(
            context,
            "DATABASES",
            ["MySQL", "SQLite", "PostgreSQL"],
          ),
          _buildCategory(
            context,
            "TOOLS",
            ["GitHub", "VS Code", "Android Studio", "IntelliJ"],
          ),
          _buildCategory(
            context,
            "METHODS",
            ["Clean Code", "Agile", "Design Thinking"],
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(
      BuildContext context, String title, List<String> items) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 2,
              color: textColor.withOpacity(0.6),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: items.map((item) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).dividerColor.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
