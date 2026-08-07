import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart' show Project;
import 'package:ramajana05/features/projects/presentation/widget/about_content.dart';

class AboutProjectSection extends StatelessWidget {
  final Project project;
  const AboutProjectSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 850;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 70,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutContent(project: project),
                const SizedBox(height: 40),
                const _KeyStatsCard(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AboutContent(
                    project: project,
                  ),
                ),
                const SizedBox(width: 60),
                const SizedBox(
                  width: 270,
                  child: _KeyStatsCard(),
                ),
              ],
            ),
    );
  }
}

class _KeyStatsCard extends StatelessWidget {
  const _KeyStatsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 28,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F3FF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Stats',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 28),
          _StatItem(
            icon: Icons.chat_bubble_outline,
            value: '50,000+',
            label: 'Quotes',
          ),
          _StatItem(
            icon: Icons.history_edu_outlined,
            value: '200+',
            label: 'Authors',
          ),
          _StatItem(
            icon: Icons.menu_book_outlined,
            value: '40+',
            label: 'Worldviews',
          ),
          _StatItem(
            icon: Icons.book_outlined,
            value: '100+',
            label: 'Books',
          ),
          _StatItem(
            icon: Icons.grid_view_outlined,
            value: '15+',
            label: 'Screens',
          ),
          _StatItem(
            icon: Icons.visibility_outlined,
            value: '100%',
            label: 'Offline Support',
            showBottomSpacing: false,
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final bool showBottomSpacing;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    this.showBottomSpacing = true,
  });

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF8064E8);

    return Padding(
      padding: EdgeInsets.only(
        bottom: showBottomSpacing ? 24 : 0,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
            color: purple,
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF656275),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
