import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';
import 'package:ramajana05/features/home/widgets/skill_chip.dart';

class AboutMeSmallSection extends StatelessWidget {
  const AboutMeSmallSection({super.key});

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
        // 🔥 HEADLINE
        const Text(
          "I build mobile apps that connect digital and real-world experiences.",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),

        const SizedBox(height: 16),

        // 🧠 TEXT
        const Text(
          "Focused on Flutter development, I create clean, scalable applications with strong UI design and real-world integration. I enjoy combining technical precision with creative problem-solving to build meaningful user experiences.",
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Colors.white70,
          ),
        ),

        const SizedBox(height: 20),

        // 👇 SKILL CHIPS
        const Row(
          children: [
            SkillChip(label: "Mobile Development"),
            SizedBox(width: 12),
            SkillChip(label: "UI / UX Design"),
            SizedBox(width: 12),
            SkillChip(label: "Backend Development"),
          ],
        ),

        const SizedBox(height: 28),

        // 🚀 CTA BUTTON (clean + fits your design)
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            foregroundColor: Colors.purpleAccent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Learn more about me",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
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
      width: 300,
      height: 300,
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
