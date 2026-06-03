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
    return RepaintBoundary(
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: _gradientShader,
        child: Image.asset(
          'assets/RamajanaLogo.png',
          filterQuality: FilterQuality.low,
          cacheWidth: 1200,
        ),
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
