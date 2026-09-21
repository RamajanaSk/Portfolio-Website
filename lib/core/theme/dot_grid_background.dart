import 'package:flutter/material.dart';

class DotGridBackground extends StatelessWidget {
  final double width;
  final double height;
  final double spacing;
  final double dotRadius;

  const DotGridBackground({
    super.key,
    this.width = 360,
    this.height = 420,
    this.spacing = 22,
    this.dotRadius = 1.4,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: _DotGridPainter(
            spacing: spacing,
            dotRadius: dotRadius,
          ),
        ),
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  final double spacing;
  final double dotRadius;

  _DotGridPainter({
    required this.spacing,
    required this.dotRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final maxDistance = center.distance;

    for (double x = 0; x <= size.width; x += spacing) {
      for (double y = 0; y <= size.height; y += spacing) {
        final position = Offset(x, y);

        final distance = (position - center).distance;

        final normalizedDistance = (distance / maxDistance).clamp(0.0, 1.0);

        final opacity = (0.45 - (normalizedDistance * 0.35)).clamp(0.10, 0.45);

        final paint = Paint()
          ..color = const Color(0xFF8A8F9D).withValues(alpha: opacity);

        canvas.drawCircle(
          position,
          dotRadius,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter oldDelegate) {
    return oldDelegate.spacing != spacing || oldDelegate.dotRadius != dotRadius;
  }
}
