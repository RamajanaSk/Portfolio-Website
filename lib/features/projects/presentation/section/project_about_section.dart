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
                    fontSize: 20,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: project.aboutPicture.isNotEmpty
                    ? SizedBox(
                        height: 300,
                        child: Image.asset(
                          project.aboutPicture,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        height: 120,
                        color: Colors.black12,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
