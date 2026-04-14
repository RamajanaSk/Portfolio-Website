import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';
import 'package:ramajana05/features/home/data/skill_data.dart';
import 'package:ramajana05/features/home/presentation/widgets/skill_chart.dart';

class AboutMeSmallSection extends StatelessWidget {
  final VoidCallback onAboutMePressed;

  const AboutMeSmallSection({
    super.key,
    required this.onAboutMePressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 40,
        bottom: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderText("About me"),
          const SizedBox(height: 20),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImage(),
                    const SizedBox(height: 30),
                    _buildText(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImage(),
                    const SizedBox(width: 60),
                    Expanded(child: _buildText()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "I build mobile apps that connect digital and real-world experiences.",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Focused on Flutter development, I create clean, scalable applications with strong UI design and real-world integration. I enjoy combining technical precision with creative problem-solving to build meaningful user experiences.",
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 28),

        // Skill bars
        SkillBars(
          skills: skills
              .map((skill) => SkillStat(
                    name: skill.name,
                    value: skill.value,
                    color: skill.color,
                  ))
              .toList(),
        ),

        const SizedBox(height: 28),

        TextButton(
          onPressed: onAboutMePressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Learn more about me",
              ),
              SizedBox(width: 6),
              Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      width: 400,
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage("assets/me_cv.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
