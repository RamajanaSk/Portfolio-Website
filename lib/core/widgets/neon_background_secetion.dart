import 'package:flutter/material.dart';

class NeonGradientSection extends StatefulWidget {
  final double height;

  const NeonGradientSection({
    super.key,
    this.height = 10,
  });

  @override
  State<NeonGradientSection> createState() => _NeonGradientSectionState();
}

class _NeonGradientSectionState extends State<NeonGradientSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  LinearGradient _buildGradient(double t) {
    return LinearGradient(
      begin: Alignment(-1 + t, -1),
      end: Alignment(1 - t, 1),
      colors: const [
        Color(0xFFFF2D95), // pink
        Color(0xFF8A2BE2), // purple
        Color(0xFF00CFFF), // blue
      ],
      stops: const [0.0, 0.5, 1.0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          height: widget.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: _buildGradient(_controller.value),
          ),
        );
      },
    );
  }
}
