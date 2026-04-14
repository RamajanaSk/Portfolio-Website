import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';

class ProjectShowcaseSection extends StatelessWidget {
  final Project project;

  const ProjectShowcaseSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final images =
        project.gallery.isNotEmpty ? project.gallery : project.mockupPicture;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderText("PROJECT GALLERY"),
          const SizedBox(height: 30),
          SizedBox(
            height: 260, // 🔥 slightly smaller = cleaner
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
                    width: 420, // 🔥 slightly reduced
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
