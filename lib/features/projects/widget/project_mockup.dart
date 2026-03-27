import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/Project.dart';

class ProjectMockup extends StatelessWidget {
  final Project project;

  const ProjectMockup({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: project.mockupPicture.isNotEmpty
            ? Image.asset(
                project.previewPicture,
                fit: BoxFit.cover,
              )
            : Container(color: Colors.black12),
      ),
    );
  }
}
