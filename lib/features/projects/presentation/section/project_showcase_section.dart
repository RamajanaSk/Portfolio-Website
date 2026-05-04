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
      padding: const EdgeInsets.all(20), // keep outer padding if you want
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderText("PROJECT SHOWCASE GALLERY"),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;

              final width = constraints.maxWidth;

              if (width > 1200) {
                crossAxisCount = 4;
              } else if (width > 800) {
                crossAxisCount = 3;
              } else if (width > 500) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 1;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 16 / 10,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
