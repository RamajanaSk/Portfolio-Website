import 'package:flutter/material.dart';

class SectionHeaderText extends StatelessWidget {
  final String text;
  final Color? accentColor;
  final String? label;
  final double fontSize;

  const SectionHeaderText(
    this.text, {
    super.key,
    this.accentColor,
    this.label,
    this.fontSize = 32,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final accent = accentColor ?? colors.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Small eyebrow / category
        if (label != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 2,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                label!.toUpperCase(),
                style: TextStyle(
                  color: colors.onSurface.withValues(alpha: 0.45),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
        ],

        // Main heading
        Text(
          text,
          style: TextStyle(
            color: colors.onSurface,
            fontSize: fontSize,
            height: 1.05,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.8,
          ),
        ),

        const SizedBox(height: 14),

        // Small accent underneath
        Row(
          children: [
            Container(
              width: 42,
              height: 2,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 24,
              height: 1,
              color: colors.onSurface.withValues(alpha: 0.12),
            ),
          ],
        ),
      ],
    );
  }
}
