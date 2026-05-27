import 'package:flutter/material.dart';

class NeonSectionDivider extends StatefulWidget {
  final double height;

  const NeonSectionDivider({
    super.key,
    this.height = 5,
  });

  @override
  State<NeonSectionDivider> createState() => _NeonSectionDividerState();
}

class _NeonSectionDividerState extends State<NeonSectionDivider>
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
        Color(0xFFFF2D95),
        Color(0xFF8A2BE2),
        Color(0xFF00CFFF),
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
