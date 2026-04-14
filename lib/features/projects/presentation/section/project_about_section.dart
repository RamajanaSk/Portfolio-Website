import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';

class ProjectAboutSection extends StatelessWidget {
  final Project project;

  const ProjectAboutSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeaderText("ABOUT"),
                const SizedBox(height: 16),
                Text(
                  project.projectReason.isNotEmpty
                      ? project.projectReason
                      : project.longDescription,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: project.previewPicture.isNotEmpty
                  ? Image.asset(
                      project.previewPicture,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 250,
                      color: Colors.black12,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
