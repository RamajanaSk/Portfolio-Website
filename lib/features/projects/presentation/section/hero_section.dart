import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/extensions/hexcolor.dart';

class HeroSection extends StatelessWidget {
  final Project project;

  const HeroSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SizedBox(
      height: isMobile ? 850 : 720,
      child: Stack(
        children: [
          // Background
          Positioned.fill(
            child: project.heroBackground.isNotEmpty
                ? Image.asset(
                    project.heroBackground,
                    fit: BoxFit.cover,
                  )
                : Container(color: const Color(0xff111111)),
          ),

          // Dark overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff050505),
                    Color(0xdd050505),
                    Color(0xaa050505),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 60,
              ),
              child: isMobile ? _buildMobile() : _buildDesktop(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDesktop() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: _HeroInformation(project),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 6,
          child: _HeroPreview(project),
        ),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      children: [
        _HeroInformation(project),
        const SizedBox(height: 40),
        Expanded(
          child: _HeroPreview(project),
        ),
      ],
    );
  }
}

class _HeroInformation extends StatelessWidget {
  final Project project;

  const _HeroInformation(this.project);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          project.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 58,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          project.subtitle,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 24,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 500,
          child: Text(
            project.shortDescription,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 17,
              height: 1.8,
            ),
          ),
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: project.technologies
              .take(3)
              .map(
                (tech) => _TechnologyChip(
                  technology: tech,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            SizedBox(
              height: 52,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: project.hexcolor.toColor(),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // instead of 20+
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "View Github",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(
                    color: Colors.white.withOpacity(.25),
                    width: 1.2,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Live Demo",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TechnologyChip extends StatelessWidget {
  final String technology;

  const _TechnologyChip({
    required this.technology,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _iconForTechnology(technology),
            size: 18,
            color: Colors.white70,
          ),
          const SizedBox(width: 8),
          Text(
            technology,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForTechnology(String tech) {
    switch (tech.toLowerCase()) {
      case "flutter":
        return Icons.flutter_dash;

      case "dart":
        return Icons.code;

      case "sqlite":
        return Icons.storage;

      case "firebase":
        return Icons.local_fire_department;

      case "rest api":
        return Icons.api;

      case "openstreetmap":
        return Icons.map;

      case "android":
        return Icons.android;

      case "ios":
        return Icons.phone_iphone;

      case "material 3":
        return Icons.palette;

      case "provider":
        return Icons.account_tree;

      case "bloc":
        return Icons.hub;

      case "git":
        return Icons.commit;

      default:
        return Icons.code;
    }
  }
}

class _HeroPreview extends StatelessWidget {
  final Project project;

  const _HeroPreview(this.project);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Hintergrundbild
        if (project.previewPicture.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              project.previewPicture,
              fit: BoxFit.contain,
            ),
          ),
      ],
    );
  }
}
