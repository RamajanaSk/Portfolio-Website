import 'package:flutter/material.dart';

/// ==========================
/// MODEL
/// ==========================
class SkillStat {
  final String name;
  final double value; // 0.0 - 1.0
  final Color color;

  SkillStat({
    required this.name,
    required this.value,
    required this.color,
  });
}

/// ==========================
/// SKILL BAR
/// ==========================
class SkillBar extends StatelessWidget {
  final SkillStat skill;

  const SkillBar({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔤 Titel + Prozent
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "${(skill.value * 100).toInt()}%",
              style: TextStyle(
                color: skill.color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // 📊 Bar Background
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              // 🔥 Filled Bar
              FractionallySizedBox(
                widthFactor: skill.value,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: skill.color,
                    boxShadow: [
                      BoxShadow(
                        color: skill.color.withOpacity(0.6),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// ==========================
/// SKILL LIST
/// ==========================
class SkillBars extends StatelessWidget {
  final List<SkillStat> skills;

  const SkillBars({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: skills.map((skill) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SkillBar(skill: skill),
        );
      }).toList(),
    );
  }
}
