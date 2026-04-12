import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/features/projects/presentation/widget/tech_chip.dart';

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
        ProjectTechnologiesRow(
          technologies: technologies,
        ),
        const SizedBox(height: 12),
        _buildRow(context, "DESCRIPTION", description),
        const SizedBox(height: 12),
        _buildRow(context, "ROLE AND CONTRIBUTION", role),
        const SizedBox(height: 12),
        _buildRow(context, "OUTCOME", outcome),
        const SizedBox(height: 12),
        _buildRow(
          context,
          "TIME PERIOD",
          _formatDateRange(startDate, endDate),
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, String title, String value) {
    final textTheme = Theme.of(context).textTheme;

    return RichText(
      text: TextSpan(
        style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
        children: [
          TextSpan(
            text: "$title: ",
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: value.toUpperCase(),
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
        Text(
          "TECHNOLOGIES & PLATFORM",
          style: AppTextStyles.projectoverviewtopic(context),
        ),
        const SizedBox(height: 10),
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
