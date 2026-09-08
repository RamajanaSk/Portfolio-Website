import 'package:flutter/material.dart';

import 'package:ramajana05/core/extensions/responsive_extension.dart';
import 'package:ramajana05/core/theme/dot_grid_background.dart';

class ResponsiveDotGridBackground extends StatelessWidget {
  const ResponsiveDotGridBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (bounds) {
                return _buildGradient(
                  context,
                  bounds,
                );
              },
              child: DotGridBackground(
                width: constraints.maxWidth,
                height: constraints.maxHeight.isFinite
                    ? constraints.maxHeight
                    : context.screenHeight,
                spacing: context.isMobile ? 18 : 22,
                dotRadius: context.isMobile ? 1.0 : 1.4,
              ),
            );
          },
        ),
      ),
    );
  }

  Shader _buildGradient(
    BuildContext context,
    Rect bounds,
  ) {
    if (context.isMobile) {
      return const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.white,
          Colors.white,
          Colors.transparent,
        ],
        stops: [
          0.0,
          0.25,
          0.75,
        ],
      ).createShader(bounds);
    }

    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.white,
        Colors.white,
        Colors.transparent,
      ],
      stops: [
        0.0,
        0.20,
        0.65,
      ],
    ).createShader(bounds);
  }
}
