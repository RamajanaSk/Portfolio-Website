import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/features/home/presentation/widgets/featured_work/compact_featured_card.dart';

class FeaturedProjectsList extends StatelessWidget {
  final List<Project> projects;
  final ValueChanged<Project> onProjectTap;

  const FeaturedProjectsList({
    required this.projects,
    required this.onProjectTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < projects.length; i++) ...[
          if (i > 0) const SizedBox(height: 14),
          CompactFeaturedProjectCard(
            project: projects[i],
            onTap: () => onProjectTap(projects[i]),
          ),
        ],
      ],
    );
  }
}
