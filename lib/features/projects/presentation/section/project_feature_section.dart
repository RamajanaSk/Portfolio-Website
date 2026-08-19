import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';

class ProjectFeaturesSection extends StatelessWidget {
  final Project project;

  const ProjectFeaturesSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "KEY FEATURES",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: project.keyFeatures.map((feature) {
              return Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(feature),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
