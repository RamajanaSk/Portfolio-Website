import 'package:flutter/material.dart';

/// 🔥 Beispiel Project Model (anpassen falls du schon eins hast)
class Project {
  final String? previewPicture;
  final String? mockupPicture;
  final String? logoPicture;
  final List<String>? gallery;

  Project({
    this.previewPicture,
    this.mockupPicture,
    this.logoPicture,
    this.gallery,
  });
}

/// 🔥 MAIN GRID
class ProjectImageGrid extends StatelessWidget {
  final Project project;

  const ProjectImageGrid({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    // 🔥 Alle Bilder sammeln
    final images = [
      project.previewPicture,
      project.mockupPicture,
      project.logoPicture,
      ...(project.gallery ?? []),
    ].whereType<String>().toList();

    if (images.isEmpty) {
      return const SizedBox(); // nichts anzeigen wenn leer
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 🔥 immer 4 pro Reihe
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1, // 🔥 quadratisch
      ),
      itemBuilder: (context, index) {
        return _ImageCard(imagePath: images[index]);
      },
    );
  }
}

/// 🔥 IMAGE CARD (mit Hover Effekt für Desktop)
class _ImageCard extends StatefulWidget {
  final String imagePath;

  const _ImageCard({required this.imagePath});

  @override
  State<_ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<_ImageCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isNetwork = widget.imagePath.startsWith('http');

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: isNetwork
              ? Image.network(
                  widget.imagePath,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
