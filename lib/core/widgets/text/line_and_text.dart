import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/line/accent_line.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/core/extensions/project_type_extension.dart';

class LineAndText extends StatelessWidget {
  final Project project;
  final Color accent;
  final int? index;

  const LineAndText({
    super.key,
    required this.project,
    required this.accent,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AccentLine(
          color: accent,
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            _buildLabel(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.58),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.8,
            ),
          ),
        ),
      ],
    );
  }

  String _buildLabel() {
    final projectIndex = index;
    final universityContext = project.universityContext?.trim();

    final projectNumber = projectIndex != null
        ? '${projectIndex.toString().padLeft(2, '0')} /'
        : null;

    final values = <String>[
      project.typ.label,
      if (universityContext != null && universityContext.isNotEmpty)
        universityContext.toUpperCase(),
      project.startDate.year.toString(),
    ];

    return [
      if (projectNumber != null) projectNumber,
      values.join(' • '),
    ].join(' ');
  }
}
