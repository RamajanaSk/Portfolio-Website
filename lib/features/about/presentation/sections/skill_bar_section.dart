import 'package:flutter/material.dart';
import 'package:ramajana05/features/home/data/model/skill.dart';

import 'package:ramajana05/features/home/presentation/widgets/skill_chart.dart';

class SkillBarSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillBarSection({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return SkillBars(
      skills: skills.map((skill) {
        return SkillStat(
          name: skill.name,
          value: skill.value,
          color: skill.color,
        );
      }).toList(),
    );
  }
}
