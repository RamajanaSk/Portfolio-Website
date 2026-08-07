import 'package:flutter/material.dart';

class PhoneMockup extends StatelessWidget {
  final String imagePath;

  /// Width of the phone.
  /// Everything else scales automatically from this.
  final double width;

  /// How much of the phone should be visible.
  /// 1.0 = full phone
  /// 0.7 = top 70%
  /// 0.5 = top half
  final double visibleFraction;

  final BoxFit imageFit;
  final Alignment imageAlignment;

  final bool showDynamicIsland;

  const PhoneMockup({
    super.key,
    required this.imagePath,
    this.width = 300,
    this.visibleFraction = 1.0,
    this.imageFit = BoxFit.cover,
    this.imageAlignment = Alignment.topCenter,
    this.showDynamicIsland = true,
  });

  @override
  Widget build(BuildContext context) {
    // Typical modern smartphone ratio
    const aspectRatio = 9 / 19.5;

    final phoneWidth = width;
    final phoneHeight = phoneWidth / aspectRatio;

    final visibleHeight = phoneHeight * visibleFraction.clamp(0.0, 1.0);

    // Everything scales based on phone width
    final scale = phoneWidth / 450;

    final outerRadius = 60 * scale;
    final innerRadius = 48 * scale;
    final phonePadding = 12 * scale;
    final borderWidth = 3 * scale;

    final islandWidth = 110 * scale;
    final islandHeight = 30 * scale;
    final islandTop = 14 * scale;

    return SizedBox(
      width: phoneWidth,
      height: visibleHeight,
      child: ClipRect(
        child: OverflowBox(
          alignment: Alignment.topCenter,
          minWidth: phoneWidth,
          maxWidth: phoneWidth,
          minHeight: phoneHeight,
          maxHeight: phoneHeight,
          child: Container(
            width: phoneWidth,
            height: phoneHeight,
            padding: EdgeInsets.all(phonePadding),
            decoration: BoxDecoration(
              color: const Color(0xFF101010),
              borderRadius: BorderRadius.circular(
                outerRadius,
              ),
              border: Border.all(
                color: const Color(0xFF3A3A3A),
                width: borderWidth,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: 0.25,
                  ),
                  blurRadius: 40 * scale,
                  offset: Offset(
                    0,
                    15 * scale,
                  ),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                innerRadius,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imagePath,
                    fit: imageFit,
                    alignment: imageAlignment,
                  ),
                  if (showDynamicIsland)
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: islandTop,
                        ),
                        width: islandWidth,
                        height: islandHeight,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            islandHeight,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
