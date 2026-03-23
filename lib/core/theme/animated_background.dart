import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with TickerProviderStateMixin {
  final int blobCount = 6;
  final Random random = Random();

  late List<AnimationController> controllers;

  late AnimationController _corner1;
  late AnimationController _corner2;
  late AnimationController _corner3;
  late AnimationController _corner4;

  // ✅ PRECOMPUTED VALUES (important)
  late List<double> sizes;
  late List<double> speedFactors;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(blobCount, (index) {
      return AnimationController(
        vsync: this,
        duration: Duration(seconds: 15 + random.nextInt(15)),
      )..repeat();
    });

    // corner controllers
    _corner1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat();
    _corner2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 25))
          ..repeat();
    _corner3 =
        AnimationController(vsync: this, duration: const Duration(seconds: 22))
          ..repeat();
    _corner4 =
        AnimationController(vsync: this, duration: const Duration(seconds: 28))
          ..repeat();

    // stable randomness
    sizes =
        List.generate(blobCount, (_) => 300 + random.nextInt(300).toDouble());
    speedFactors = List.generate(blobCount, (_) => 0.5 + random.nextDouble());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }

    _corner1.dispose();
    _corner2.dispose();
    _corner3.dispose();
    _corner4.dispose();

    super.dispose();
  }

  Widget _buildBlob(int index) {
    final controller = controllers[index];

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final t = controller.value * 2 * pi * speedFactors[index];

        final x = sin(t + index) * 0.8;
        final y = cos(t * 0.7 + index) * 0.8;

        final color = index % 2 == 0
            ? const Color(0xFF6A00FF).withOpacity(0.4)
            : const Color(0xFF00BFFF).withOpacity(0.35);

        return Align(
          alignment: Alignment(x, y),
          child: Container(
            width: sizes[index],
            height: sizes[index],
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCornerBlob({
    required AnimationController controller,
    required Alignment base,
    required Color color,
    required double size,
    required int seed,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final t = controller.value * 2 * pi;

        final dx = sin(t + seed) * 0.3;
        final dy = cos(t * 0.8 + seed) * 0.3;

        return Align(
          alignment: Alignment(base.x + dx, base.y + dy),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base
        Container(color: Theme.of(context).scaffoldBackgroundColor),

        // Blobs
        ...List.generate(blobCount, (index) => _buildBlob(index)),

        // Corner blobs
        _buildCornerBlob(
          controller: _corner1,
          base: const Alignment(-1, -1),
          color: const Color(0xFF6A00FF).withOpacity(0.4),
          size: 500,
          seed: 1,
        ),
        _buildCornerBlob(
          controller: _corner2,
          base: const Alignment(1, -1),
          color: const Color(0xFF00BFFF).withOpacity(0.35),
          size: 450,
          seed: 2,
        ),
        _buildCornerBlob(
          controller: _corner3,
          base: const Alignment(-1, 1),
          color: const Color(0xFFEDEDED).withOpacity(0.25),
          size: 550,
          seed: 3,
        ),
        _buildCornerBlob(
          controller: _corner4,
          base: const Alignment(1, 1),
          color: const Color(0xFF6A00FF).withOpacity(0.3),
          size: 500,
          seed: 4,
        ),

        // Blur layer (wrap for performance)
        RepaintBoundary(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 140, sigmaY: 140),
            child: Container(color: Colors.transparent),
          ),
        ),

        // Content ALWAYS LAST
        widget.child,
      ],
    );
  }
}
