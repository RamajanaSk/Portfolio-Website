import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';

class ProjectHeaderSection extends StatelessWidget {
  final Project project;

  const ProjectHeaderSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 TITLE
          Text(
            project.name.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 12),

          // 🔥 DESCRIPTION
          Text(
            project.shortDescription,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
              height: 1.4,
            ),
          ),

          const Spacer(),

          // 🔥 OPTIONAL META (nice touch)
          Row(
            children: [
              if (project.role != null)
                Text(
                  project.role!,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                ),
              const Spacer(),
              Text(
                project.startDate.year.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
