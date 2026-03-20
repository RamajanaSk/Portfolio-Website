import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillsSection({
    Key? key,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Color(0xFF1F1F1F), // Dark background for the section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Skills",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // to disable scrolling within the GridView
            crossAxisCount: 3,
            childAspectRatio: 4 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children:
                skills.map((specialty) => _buildSkillsCard(specialty)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsCard(Skill specialty) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF333333), // Slightly lighter dark shade for cards
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(specialty.icon, color: specialty.iconColor, size: 40),
          SizedBox(height: 10),
          Text(
            specialty.title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            specialty.description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class Skill {
  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;

  Skill({
    required this.icon,
    required this.title,
    required this.description,
    this.iconColor = Colors.purple,
  });
}
