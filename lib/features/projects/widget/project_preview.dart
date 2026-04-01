import 'package:flutter/material.dart';

import 'package:ramajana05/features/projects/widget/project_header.dart';

import '../../../Data/Models/Project.dart' show Project;

class ProjectPreview extends StatelessWidget {
  final Project project;

  const ProjectPreview({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return ProjectHeaderSection(project: project);
  }
}
