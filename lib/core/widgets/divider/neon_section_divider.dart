import 'package:flutter/material.dart';

class NeonSectionDivider extends StatelessWidget {
  final double height;

  const NeonSectionDivider({
    super.key,
    this.height = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            const Color(0xFFFF2D95).withValues(alpha: .65),
            const Color(0xFF8A2BE2).withValues(alpha: .85),
            const Color(0xFF00CFFF).withValues(alpha: .65),
            Colors.transparent,
          ],
          stops: const [
            0.0,
            0.12,
            0.50,
            0.88,
            1.0,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8A2BE2).withValues(alpha: .12),
            blurRadius: 3,
          ),
        ],
      ),
    );
  }
}
