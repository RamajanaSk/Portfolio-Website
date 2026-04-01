import 'package:flutter/material.dart';
import 'package:ramajana05/features/projects/widget/tech_chip.dart';

class ProjectInfoCard extends StatelessWidget {
  final String technologies;
  final String description;
  final String role;
  final String outcome;
  final DateTime startDate;
  final DateTime? endDate;

  const ProjectInfoCard({
    super.key,
    required this.technologies,
    required this.description,
    required this.role,
    required this.outcome,
    required this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔥 TECHNOLOGIES (SPEZIAL ROW)
        ProjectTechnologiesRow(
          technologies: technologies,
        ),

        const SizedBox(height: 12),

        _buildRow("DESCRIPTION", description),
        const SizedBox(height: 12),

        _buildRow("ROLE AND CONTRIBUTION", role),
        const SizedBox(height: 12),

        _buildRow("OUTCOME", outcome),
        const SizedBox(height: 12),

        _buildRow(
          "TIME PERIOD",
          _formatDateRange(startDate, endDate),
        ),
      ],
    );
  }

  Widget _buildRow(String title, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
          TextSpan(
            text: value.toUpperCase(),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateRange(DateTime start, DateTime? end) {
    if (end == null) return "${start.month}/${start.year} - NOW";
    return "${start.month}/${start.year} - ${end.month}/${end.year}";
  }
}

class ProjectTechnologiesRow extends StatelessWidget {
  final String technologies;

  const ProjectTechnologiesRow({
    super.key,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    final techList = technologies.split(',');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "TECHNOLOGIES & PLATFORM:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 17,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: techList.map((tech) {
            return TechChip(label: tech.trim());
          }).toList(),
        ),
      ],
    );
  }
}
