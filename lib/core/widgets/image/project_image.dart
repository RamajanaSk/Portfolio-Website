import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final String imagePath;
  final double borderRadius;
  final double aspectRatio;
  final BoxFit fit;
  final Alignment alignment;

  const ProjectImage({
    super.key,
    required this.imagePath,
    this.borderRadius = 5,
    this.aspectRatio = 16 / 9,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Image.asset(
          imagePath,
          fit: fit,
          alignment: alignment,
        ),
      ),
    );
  }
}
