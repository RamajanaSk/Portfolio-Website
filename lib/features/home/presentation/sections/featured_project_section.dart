import 'package:flutter/material.dart';
import 'package:ramajana05/Data/dummyData.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';

class FeaturedProjectSection extends StatelessWidget {
  const FeaturedProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = dummyProjects;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 40,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeaderText("Featured Project"),
              const SizedBox(height: 40),
              isMobile
                  ? _buildMobileLayout(projects)
                  : _buildDesktopLayout(projects),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(List projects) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildMainImage(),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: _buildText(projects),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(List projects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMainImage(),
        const SizedBox(height: 16),
        _buildText(projects),
      ],
    );
  }

  Widget _buildMainImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: Image.asset(
          'images/traveler/traveler_main.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildText(List projects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          projects.first.name,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          projects.first.shortDescription,
          style: const TextStyle(
            color: Colors.white70,
            height: 1.6,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            _TechChip("Flutter"),
            _TechChip("Unity"),
            _TechChip("OpenStreetMap"),
          ],
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purpleAccent,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("View Project"),
        ),
      ],
    );
  }
}

// =========================
// 🔹 TECH CHIP
// =========================
class _TechChip extends StatelessWidget {
  final String text;

  const _TechChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
        ),
      ),
    );
  }
}
