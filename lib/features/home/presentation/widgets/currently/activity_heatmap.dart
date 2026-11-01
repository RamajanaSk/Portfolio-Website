import 'package:flutter/material.dart';

class ActivityHeatmap extends StatelessWidget {
  final List<int>? dailyCommits;
  final Color accent;

  const ActivityHeatmap({
    super.key,
    required this.dailyCommits,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;
    final values = dailyCommits;

    if (values == null || values.length != 84) {
      return Text(
        'Activity unavailable',
        style: TextStyle(
          color: foreground.withValues(alpha: 0.35),
          fontSize: 11,
        ),
      );
    }

    return Semantics(
      label: 'Repository commits over the last 84 days, in UTC',
      child: LayoutBuilder(
        builder: (context, constraints) {
          const gap = 3.0;

          final cellSize = ((constraints.maxWidth - 11 * gap) / 12)
              .clamp(1.0, 10.0)
              .toDouble();

          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: [
              for (var week = 0; week < 12; week++)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var day = 0; day < 7; day++) ...[
                      if (day > 0) const SizedBox(height: gap),
                      Container(
                        width: cellSize,
                        height: cellSize,
                        decoration: BoxDecoration(
                          color: _cellColor(
                            values[week * 7 + day],
                            foreground,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Color _cellColor(int count, Color foreground) {
    if (count <= 0) {
      return foreground.withValues(alpha: 0.07);
    }

    final opacity = switch (count) {
      1 => 0.25,
      2 => 0.45,
      <= 4 => 0.7,
      _ => 1.0,
    };

    return accent.withValues(alpha: opacity);
  }
}
