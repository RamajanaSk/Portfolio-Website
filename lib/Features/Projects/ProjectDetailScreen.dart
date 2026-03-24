import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/features/Home/widgets/Sections/project_overview_section.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;
  final VoidCallback onBack;

  const ProjectDetailScreen(
      {super.key, required this.project, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Projectoverviewsection(project: project),
          ),
        ],
      ),
    );
  }
}
