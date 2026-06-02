import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class GTKMRightSideWidget extends StatelessWidget {
  const GTKMRightSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final s = AppResponsive.scale(context).clamp(0.85, 1.2);

    double width;

    if (screenWidth < 600) {
      width = screenWidth * 0.9;
    } else if (screenWidth < 900) {
      width = screenWidth * 0.7;
    } else {
      width = screenWidth * 0.45 * s;
    }

    return Center(
      child: SizedBox(
        width: width,
        height: width * 1.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFFFF2D95),
                    Color(0xFFFF2D95),
                    Color(0xFF8A2BE2),
                    Color(0xFF00CFFF),
                  ],
                  stops: [0.0, 0.35, 0.65, 1.0],
                ).createShader(bounds);
              },
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 12,
                  sigmaY: 12,
                ),
                child: Opacity(
                  opacity: 0.2,
                  child: Stack(
                    children: [
                      _outline(offset: const Offset(-1, 0)),
                      _outline(offset: const Offset(1, 0)),
                      _outline(offset: const Offset(0, -1)),
                      _outline(offset: const Offset(0, 1)),
                    ],
                  ),
                ),
              ),
            ),
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFFFF2D95),
                    Color(0xFFFF2D95),
                    Color(0xFF8A2BE2),
                    Color(0xFF00CFFF),
                  ],
                  stops: [0.0, 0.35, 0.65, 1.0],
                ).createShader(bounds);
              },
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Opacity(
                  opacity: 1,
                  child: Stack(
                    children: [
                      _outlineMain(offset: const Offset(-1, 0)),
                      _outlineMain(offset: const Offset(1, 0)),
                      _outlineMain(offset: const Offset(0, -1)),
                      _outlineMain(offset: const Offset(0, 1)),
                    ],
                  ),
                ),
              ),
            ),
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFFFF2D95),
                    Color(0xFFFF2D95),
                    Color(0xFF8A2BE2),
                    Color(0xFF00CFFF),
                  ],
                  stops: [0.0, 0.35, 0.65, 1.0],
                ).createShader(bounds);
              },
              child: Stack(
                children: [
                  _outlineMain(offset: const Offset(-1, 0)),
                  _outlineMain(offset: const Offset(1, 0)),
                  _outlineMain(offset: const Offset(0, -1)),
                  _outlineMain(offset: const Offset(0, 1)),
                ],
              ),
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.8,
                child: Image.asset(
                  'assets/me_cut.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _outline({required Offset offset}) {
    return Transform.translate(
      offset: offset,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 0,
          sigmaY: 0,
        ),
        child: ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.8,
            child: Image.asset(
              'assets/me_cut.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _outlineMain({required Offset offset}) {
  return Transform.translate(
    offset: offset,
    child: ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 1,
        sigmaY: 1,
      ),
      child: Image.asset(
        'assets/RamajanaLogo.png',
      ),
    ),
  );
}
