import 'package:flutter/material.dart';

class AccentLine extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double glowOpacity;
  final double glowRadius;

  const AccentLine({
    super.key,
    required this.color,
    this.width = 30,
    this.height = 3,
    this.glowOpacity = 0.45,
    this.glowRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: glowOpacity),
            blurRadius: glowRadius,
          ),
        ],
      ),
    );
  }
}
