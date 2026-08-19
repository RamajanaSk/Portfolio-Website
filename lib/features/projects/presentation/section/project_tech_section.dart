import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';

class ProjectTechSection extends StatelessWidget {
  final Project project;

  const ProjectTechSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TECH STACK",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            children: project.technologies.map((tech) {
              return Chip(label: Text(tech));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
