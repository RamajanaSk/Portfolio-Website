import 'package:flutter/material.dart';

class SmokyAnimatedBar extends StatefulWidget {
  final double height;

  const SmokyAnimatedBar({Key? key, this.height = 8.0}) : super(key: key);

  @override
  State<SmokyAnimatedBar> createState() => _SmokyAnimatedBarState();
}

class _SmokyAnimatedBarState extends State<SmokyAnimatedBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
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
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              gradient: _buildGradient(_controller.value),
            ),
          ),
        );
      },
    );
  }
}
