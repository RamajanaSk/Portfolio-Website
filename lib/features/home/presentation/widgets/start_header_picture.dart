import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class GTKMRightSideWidget extends StatelessWidget {
  const GTKMRightSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final s = AppResponsive.scale(context).clamp(0.85, 1.2);

    double width;

    if (screenWidth < 600) {
      width = screenWidth * 0.9;
    } else if (screenWidth < 900) {
      width = screenWidth * 0.7;
    } else {
      width = screenWidth * 0.45 * s;
    }

    return RepaintBoundary(
      child: Center(
        child: SizedBox(
          width: width,
          height: width * 1.2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildGlow(isMobile),
              _buildOutline(),
              ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.8,
                  child: Image.asset(
                    'assets/me_cut.png',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                    cacheWidth: 1200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlow(bool isMobile) {
    return RepaintBoundary(
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: _gradientShader,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: isMobile ? 6 : 12,
            sigmaY: isMobile ? 6 : 12,
          ),
          child: Opacity(
            opacity: 0.45,
            child: Image.asset(
              'assets/RamajanaLogo.png',
              filterQuality: FilterQuality.low,
              cacheWidth: 1200,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutline() {
    const logoPath = 'assets/RamajanaLogo.png';

    return RepaintBoundary(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ============================================================
          // SHADOW
          // ============================================================

          Transform.translate(
            offset: const Offset(12, 14),
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                logoPath,
                filterQuality: FilterQuality.low,
                cacheWidth: 1200,
                color: Colors.black,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ),

          // ============================================================
          // 3D DEPTH / EXTRUSION
          // ============================================================

          for (int i = 10; i >= 1; i--)
            Transform.translate(
              offset: Offset(
                i * 0.9,
                i * 0.9,
              ),
              child: Image.asset(
                logoPath,
                filterQuality: FilterQuality.low,
                cacheWidth: 1200,
                color: Color.lerp(
                  const Color(0xFF151522),
                  const Color.fromARGB(255, 0, 0, 0),
                  i / 10,
                ),
                colorBlendMode: BlendMode.srcIn,
              ),
            ),

          // ============================================================
          // MAIN GRADIENT FACE
          // ============================================================

          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: _gradientShader,
            child: Image.asset(
              logoPath,
              filterQuality: FilterQuality.high,
              cacheWidth: 1200,
            ),
          ),

          // ============================================================
          // SUBTLE HIGHLIGHT
          // ============================================================

          Transform.translate(
            offset: const Offset(-1.2, -1.2),
            child: Opacity(
              opacity: 0.16,
              child: Image.asset(
                logoPath,
                filterQuality: FilterQuality.low,
                cacheWidth: 1200,
                color: Colors.white,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Shader _gradientShader(Rect bounds) {
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
  }
}
