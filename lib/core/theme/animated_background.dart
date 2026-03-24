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
  final int blobCount = 2;
  final Random random = Random();

  late List<AnimationController> controllers;

  late AnimationController _leftGlow;
  late AnimationController _rightGlow;

  late List<double> sizes;
  late List<double> speedFactors;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(blobCount, (index) {
      return AnimationController(
        vsync: this,
        duration: Duration(seconds: 18 + random.nextInt(10)),
      )..repeat();
    });

    _leftGlow =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat();

    _rightGlow =
        AnimationController(vsync: this, duration: const Duration(seconds: 25))
          ..repeat();

    sizes =
        List.generate(blobCount, (_) => 350 + random.nextInt(300).toDouble());

    speedFactors = List.generate(blobCount, (_) => 0.5 + random.nextDouble());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    _leftGlow.dispose();
    _rightGlow.dispose();
    super.dispose();
  }

  Widget _buildBlob(int index) {
    final controller = controllers[index];

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final t = controller.value * 2 * pi;

        final x = sin(t + index) * 0.5;
        final y = cos(t * 0.6 + index) * 0.5;

        final isPink = index == 0; // 👈 nur EIN pink blob dominant

        return Align(
          alignment: Alignment(x, y),
          child: Container(
            width: 500, // größer
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  (isPink
                          ? const Color.fromARGB(255, 45, 181, 255)
                          : const Color(0xFF00CFFF))
                      .withOpacity(isPink ? 0.85 : 0.35),
                  (isPink
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : const Color(0xFF00CFFF))
                      .withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSideGlow({
    required AnimationController controller,
    required Alignment base,
    required Color color,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final t = controller.value * 2 * pi;

        final dx = sin(t) * 0.2;
        final dy = cos(t * 0.8) * 0.2;

        return Align(
          alignment: Alignment(base.x + dx, base.y + dy),
          child: Container(
            width: 600,
            height: 600,
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
        // 🌈 BASE GRADIENT (matches your image)
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 0, 0, 0), // dark purple (left)
                Color.fromARGB(255, 0, 0, 0), // dark blue (right)
              ],
            ),
          ),
        ),

        // 🔥 moving blobs
        ...List.generate(blobCount, (index) => _buildBlob(index)),

        // 💡 left pink glow
        _buildSideGlow(
          controller: _leftGlow,
          base: const Alignment(0.5, 0),
          color: const Color.fromARGB(255, 255, 15, 159),
        ),

        // 💡 right blue glow
        _buildSideGlow(
          controller: _rightGlow,
          base: const Alignment(0.7, 0),
          color: const Color.fromARGB(255, 11, 154, 255),
        ),

        // 🌫️ blur layer (creates glow effect)
        RepaintBoundary(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 180, sigmaY: 180),
            child: Container(color: const Color.fromARGB(0, 0, 0, 0)),
          ),
        ),

        // 👇 your content
        widget.child,
      ],
    );
  }
}
