import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsOverviewSection extends StatelessWidget {
  const SkillsOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 50 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SKILLS & EXPERTISE",
            style: TextStyle(
              fontSize: isMobile ? 34 : 48,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              color: textColor,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: 120,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF2D95),
                  Color(0xFF8A2BE2),
                  Color(0xFF00CFFF),
                ],
              ),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),
          Wrap(
            spacing: 28,
            runSpacing: 28,
            children: [
              _SkillCard(
                title: "METHODOLOGIES",
                icon: Icons.architecture_rounded,
                items: const [
                  "Design Thinking",
                  "Agile Development",
                  "Clean Code",
                  "Project Planning",
                  "Problem Solving",
                ],
              ),
              _SkillCard(
                title: "PERSONAL SKILLS",
                icon: Icons.psychology_alt_rounded,
                items: const [
                  "Strong Communication",
                  "Presentation Skills",
                  "Teamwork",
                  "Independent Working",
                  "Responsibility",
                ],
              ),
              _SkillCard(
                title: "DESIGN",
                icon: Icons.palette_outlined,
                items: const [
                  "Adobe Illustrator",
                  "Adobe Photoshop",
                  "UI/UX Design",
                  "Creative Direction",
                ],
              ),
              _SkillCard(
                title: "TOOLS",
                icon: Icons.code_rounded,
                items: const [
                  "VS Code",
                  "Android Studio",
                  "GitHub",
                  "IntelliJ",
                ],
              ),
              _SkillCard(
                title: "LANGUAGES",
                icon: Icons.language_rounded,
                items: const [
                  "German — Native",
                  "English — C1",
                ],
              ),
              _SkillCard(
                title: "INTERESTS",
                icon: Icons.favorite_border_rounded,
                items: const [
                  "Music Production",
                  "Photography",
                  "Travel",
                  "Gaming",
                  "Creative Tech",
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> items;

  const _SkillCard({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: isMobile ? double.infinity : 340,
        padding: const EdgeInsets.all(28),
        transform: Matrix4.identity()
          ..translate(
            0.0,
            hovered ? -6.0 : 0.0,
          ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: hovered
                ? [
                    const Color(0x22FF2D95),
                    const Color(0x228A2BE2),
                    const Color(0x2200CFFF),
                  ]
                : [
                    Colors.white.withOpacity(0.03),
                    Colors.white.withOpacity(0.015),
                  ],
          ),
          border: Border.all(
            color: hovered
                ? Colors.white.withOpacity(0.15)
                : Colors.white.withOpacity(0.06),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: hovered ? 30 : 10,
              spreadRadius: hovered ? 1 : 0,
              color: hovered
                  ? const Color(0xFF8A2BE2).withOpacity(0.15)
                  : Colors.black.withOpacity(0.15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF2D95),
                    Color(0xFF8A2BE2),
                    Color(0xFF00CFFF),
                  ],
                ),
              ),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 22),
            ...widget.items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      margin: const EdgeInsets.only(top: 7),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF2D95),
                            Color(0xFF00CFFF),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.white.withOpacity(0.82),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms).moveY(
          begin: 20,
          end: 0,
        );
  }
}
