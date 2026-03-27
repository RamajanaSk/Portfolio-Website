import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';

class ProjectShowcaseSection extends StatelessWidget {
  final Project project;

  const ProjectShowcaseSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final images =
        project.gallery.isNotEmpty ? project.gallery : project.mockupPicture;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          itemCount: images.length,
          separatorBuilder: (_, __) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                images[index],
                width: 500,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
