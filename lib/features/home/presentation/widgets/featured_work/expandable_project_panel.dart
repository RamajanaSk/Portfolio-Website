import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/features/home/presentation/widgets/featured_work/featured_project_list.dart';
import 'package:ramajana05/features/home/presentation/widgets/featured_work/work_panel.dart';

class ExpandableProjectPanel extends StatelessWidget {
  final double? toolkitHeight;
  final List<Project> projects;
  final ValueChanged<Project> onProjectTap;

  const ExpandableProjectPanel({
    required this.toolkitHeight,
    required this.projects,
    required this.onProjectTap,
  });

  @override
  Widget build(BuildContext context) {
    return WorkPanel(
      number: '01',
      title: 'SELECTED WORK',
      subtitle: 'Explore the ideas behind the interfaces.',
      icon: Icons.layers_outlined,
      accent: const Color(0xFFFF299D),
      minHeight: toolkitHeight,
      child: FeaturedProjectsList(
        projects: projects,
        onProjectTap: onProjectTap,
      ),
    );
  }
}
