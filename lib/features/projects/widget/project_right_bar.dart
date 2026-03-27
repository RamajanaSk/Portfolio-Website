import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/Project.dart';

class ProjectRightBar extends StatelessWidget {
  final Project project;
  final Color color;

  const ProjectRightBar({
    super.key,
    required this.project,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                project.startDate.year.toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
