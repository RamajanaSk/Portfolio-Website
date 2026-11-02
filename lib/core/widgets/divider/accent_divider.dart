import 'package:flutter/material.dart';

class AccentDivider extends StatelessWidget {
  final Color accentColor;
  final double accentWidth;
  final double accentHeight;
  final double lineHeight;
  final double spacing;

  const AccentDivider({
    super.key,
    this.accentColor = const Color(0xFF6B9EFF),
    this.accentWidth = 48,
    this.accentHeight = 3,
    this.lineHeight = 1,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Row(
      children: [
        Container(
          width: accentWidth,
          height: accentHeight,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: spacing),
        Expanded(
          child: Container(
            height: lineHeight,
            color: foreground.withValues(alpha: 0.1),
          ),
        ),
      ],
    );
  }
}
