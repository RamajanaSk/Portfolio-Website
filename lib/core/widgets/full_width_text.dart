import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/background/neon_gradient_background.dart';

class FullWidthText extends StatelessWidget {
  final String text;

  const FullWidthText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return NeonGradientBackground(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(80),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
