import 'package:flutter/material.dart';

class ProjectColorYearCard extends StatelessWidget {
  final int year;
  final Color backgroundColor;

  const ProjectColorYearCard({
    super.key,
    required this.year,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            year.toString(),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
