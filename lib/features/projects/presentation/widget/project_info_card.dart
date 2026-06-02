import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';

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
        Text(
          context.l10n.technologiesPlatform,
          style: AppTextStyles.projectoverviewtopic(context),
        ),
        const SizedBox(height: 16),
        _buildRow(
          context,
          context.l10n.description,
          description,
        ),
        const SizedBox(height: 12),
        _buildRow(
          context,
          context.l10n.roleAndContribution,
          role,
        ),
        const SizedBox(height: 12),
        if (outcome.isNotEmpty)
          _buildRow(
            context,
            context.l10n.outcome,
            outcome,
          ),
        if (outcome.isNotEmpty) const SizedBox(height: 12),
        _buildRow(
          context,
          context.l10n.timePeriod,
          _formatDateRange(startDate, endDate),
        ),
      ],
    );
  }

  Widget _buildRow(
    BuildContext context,
    String title,
    String value,
  ) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.description(context),
        children: [
          TextSpan(
            text: "$title ",
            style: AppTextStyles.description(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: AppTextStyles.description(context),
          ),
        ],
      ),
    );
  }

  String _formatDateRange(DateTime start, DateTime? end) {
    if (end == null) {
      return "${start.month}/${start.year} - NOW";
    }

    return "${start.month}/${start.year} - ${end.month}/${end.year}";
  }
}
