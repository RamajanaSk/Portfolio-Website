import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';

class ProjectChallengesSection extends StatelessWidget {
  final Project project;

  const ProjectChallengesSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CHALLENGES",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...project.challenges.map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("• $c"),
            ),
          ),
        ],
      ),
    );
  }
}
