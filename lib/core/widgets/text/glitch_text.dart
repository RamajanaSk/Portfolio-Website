import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';

class GlitchText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final bool subtle;

  const GlitchText({
    super.key,
    required this.text,
    required this.style,
    this.subtle = false,
  });

  @override
  State<GlitchText> createState() => _GlitchTextState();
}

class _GlitchTextState extends State<GlitchText> {
  final Random _random = Random();

  Timer? _glitchTimer;

  double _offsetX = 0;
  double _offsetY = 0;

  bool _glitching = true;

  @override
  void initState() {
    super.initState();

    _startInitialGlitch();
  }

  Future<void> _startInitialGlitch() async {
    // Strong glitch only when CREATIVE appears
    for (int i = 0; i < 8; i++) {
      if (!mounted) return;

      setState(() {
        _offsetX = (_random.nextDouble() - 0.5) * 8;
        _offsetY = (_random.nextDouble() - 0.5) * 4;
        _glitching = true;
      });

      await Future.delayed(
        const Duration(milliseconds: 35),
      );
    }

    if (!mounted) return;

    setState(() {
      _offsetX = 0;
      _offsetY = 0;
      _glitching = false;
    });

    // Occasional subtle glitch while visible
    _glitchTimer = Timer.periodic(
      const Duration(milliseconds: 900),
      (_) => _smallGlitch(),
    );
  }

  Future<void> _smallGlitch() async {
    if (!mounted) return;

    setState(() {
      _offsetX = (_random.nextDouble() - 0.5) * 5;
      _offsetY = (_random.nextDouble() - 0.5) * 2;
      _glitching = true;
    });

    await Future.delayed(
      const Duration(milliseconds: 55),
    );

    if (!mounted) return;

    setState(() {
      _offsetX = 0;
      _offsetY = 0;
      _glitching = false;
    });
  }

  @override
  void dispose() {
    _glitchTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final creativeStyle = widget.style.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      letterSpacing: 2.5,
    );

    return Transform.rotate(
      angle: -0.025,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // ============================================================
          // CYAN GLITCH SHADOW
          // ============================================================

          if (_glitching)
            Transform.translate(
              offset: Offset(
                _offsetX - 3,
                _offsetY,
              ),
              child: Text(
                widget.text,
                style: creativeStyle.copyWith(
                  color: const Color(0xFF31D6FF).withValues(alpha: 0.65),
                ),
              ),
            ),

          // ============================================================
          // PINK GLITCH SHADOW
          // ============================================================

          if (_glitching)
            Transform.translate(
              offset: Offset(
                -_offsetX + 3,
                -_offsetY,
              ),
              child: Text(
                widget.text,
                style: creativeStyle.copyWith(
                  color: const Color(0xFFFF3D9A).withValues(alpha: 0.65),
                ),
              ),
            ),

          // ============================================================
          // MAIN GRADIENT TEXT
          // ============================================================

          Transform.translate(
            offset: Offset(
              _offsetX * 0.25,
              _offsetY * 0.25,
            ),
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  AppGradients.primary.createShader(bounds),
              child: Text(
                widget.text,
                style: creativeStyle,
              ),
            ),
          ),

          // ============================================================
          // ACCENT LINE
          // ============================================================

          Positioned(
            left: 2,
            right: 2,
            bottom: -5,
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: AppGradients.primary,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // ============================================================
          // LITTLE DECORATIVE MARK
          // ============================================================

          Positioned(
            right: -8,
            top: -5,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: _glitching ? 1 : 0.5,
              child: Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF3D9A),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
