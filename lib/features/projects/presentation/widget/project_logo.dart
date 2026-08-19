import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';

class ProjectLogo extends StatelessWidget {
  final Project project;

  const ProjectLogo({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: project.logoPicture.isNotEmpty
            ? Image.asset(
                project.logoPicture,
                fit: BoxFit.contain,
              )
            : Container(color: Colors.black12),
      ),
    );
  }
}
