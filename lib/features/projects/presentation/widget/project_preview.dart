import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_header.dart';

class ProjectPreview extends StatelessWidget {
  final Project project;

  const ProjectPreview({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return ProjectHeader(project: project);
  }
}
