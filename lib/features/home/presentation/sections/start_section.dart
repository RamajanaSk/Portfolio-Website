import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/dot_grid_background.dart';
import 'package:ramajana05/features/home/presentation/widgets/start_header_picture.dart';
import 'package:ramajana05/features/home/presentation/widgets/start_header_text.dart';

class StartSection extends StatelessWidget {
  const StartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 900;

        return Stack(
          fit: StackFit.passthrough,
          children: [
            // =========================================================
            // FULL SECTION DOT BACKGROUND
            // FADES FROM CENTER -> RIGHT
            // =========================================================
            Positioned.fill(
              child: IgnorePointer(
                child: ShaderMask(
                  blendMode: BlendMode.dstIn,
                  shaderCallback: (bounds) {
                    if (isMobile) {
                      // MOBILE:
                      // Dots are strongest at the bottom
                      // and fade out towards the top.
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

                    // DESKTOP:
                    // Dots are strongest on the left
                    // and fade out towards the right.
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
                  },
                  child: DotGridBackground(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight.isFinite
                        ? constraints.maxHeight
                        : MediaQuery.sizeOf(context).height,
                    spacing: isMobile ? 18 : 22,
                    dotRadius: isMobile ? 1.0 : 1.4,
                  ),
                ),
              ),
            ),

            // =========================================================
            // ACTUAL CONTENT
            // =========================================================
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: isMobile
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        StartHeaderText(),
                        SizedBox(height: 40),
                        GTKMRightSideWidget(),
                      ],
                    )
                  : const Row(
                      children: [
                        Expanded(
                          child: GTKMRightSideWidget(),
                        ),
                        Expanded(
                          child: StartHeaderText(),
                        ),
                      ],
                    ),
            ),
          ],
        );
      },
    );
  }
}
