import 'package:flutter/material.dart';

class NormalSectionDivider extends StatelessWidget {
  final Color color;
  final double width;
  final double spacing;

  const NormalSectionDivider({
    super.key,
    required this.color,
    this.width = 80,
    this.spacing = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: Row(
        children: [
          // Colored accent
          Container(
            width: width,
            height: 2,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(width: 16),

          // Subtle continuation
          Expanded(
            child: Container(
              height: 1,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.08),
            ),
          ),
        ],
      ),
    );
  }
}
