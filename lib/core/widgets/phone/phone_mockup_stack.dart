import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/phone/phone_mockup.dart';

class PhoneMockupStack extends StatelessWidget {
  final String frontImagePath;
  final String backImagePath;

  /// Width of the front/main phone.
  final double width;

  /// Size of the back phone relative to the front phone.
  /// 0.78 = 78% of the front phone.
  final double backScale;

  /// Horizontal position of the back phone.
  /// Smaller = further left.
  /// Larger = further right.
  final double backXFactor;

  /// Vertical offset of the back phone.
  final double backOffsetY;

  final double visibleFraction;

  final BoxFit imageFit;
  final Alignment imageAlignment;

  final bool showDynamicIsland;

  const PhoneMockupStack({
    super.key,
    required this.frontImagePath,
    required this.backImagePath,
    this.width = 300,
    this.backScale = 0.78,
    this.backXFactor = 0.38,
    this.backOffsetY = 45,
    this.visibleFraction = 1.0,
    this.imageFit = BoxFit.cover,
    this.imageAlignment = Alignment.topCenter,
    this.showDynamicIsland = true,
  });

  @override
  Widget build(BuildContext context) {
    const aspectRatio = 9 / 19.5;

    final frontHeight = width / aspectRatio;
    final visibleHeight = frontHeight * visibleFraction.clamp(0.0, 1.0);

    final backWidth = width * backScale;

    // Horizontal position is relative to phone width.
    final offsetX = width * backXFactor;

    // Vertical position scales with phone size.
    final scale = width / 300;
    final offsetY = backOffsetY * scale;

    // Make sure the SizedBox contains the back phone too.
    final totalWidth = offsetX + backWidth;

    return SizedBox(
      width: totalWidth > width ? totalWidth : width,
      height: visibleHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // BACK PHONE
          Positioned(
            left: offsetX,
            top: offsetY,
            child: PhoneMockup(
              imagePath: backImagePath,
              width: backWidth,
              visibleFraction: visibleFraction,
              imageFit: imageFit,
              imageAlignment: imageAlignment,
              showDynamicIsland: showDynamicIsland,
            ),
          ),

          // FRONT PHONE
          Positioned(
            left: 0,
            top: 0,
            child: PhoneMockup(
              imagePath: frontImagePath,
              width: width,
              visibleFraction: visibleFraction,
              imageFit: imageFit,
              imageAlignment: imageAlignment,
              showDynamicIsland: showDynamicIsland,
            ),
          ),
        ],
      ),
    );
  }
}
