import 'dart:ui';
import 'package:flutter/material.dart';

class NeonGradientBackground extends StatelessWidget {
  final Widget child;

  const NeonGradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFF007A),
                  Color(0xFF8A2BE2),
                  Color(0xFF2D5BFF),
                  Color(0xFF050510),
                ],
                stops: [0.0, 0.35, 0.7, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          top: -120,
          left: -80,
          child: _glowBlob(
            color: const Color(0xFFFF007A),
            size: 320,
          ),
        ),
        Positioned(
          bottom: -140,
          right: -100,
          child: _glowBlob(
            color: const Color(0xFF2D5BFF),
            size: 360,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        child,
      ],
    );
  }

  Widget _glowBlob({
    required Color color,
    required double size,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.25),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 180,
            spreadRadius: 40,
          ),
        ],
      ),
    );
  }
}
