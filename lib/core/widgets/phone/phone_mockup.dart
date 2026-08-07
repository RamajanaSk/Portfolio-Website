import 'package:flutter/material.dart';

class PhoneMockup extends StatelessWidget {
  final String imagePath;

  final double visibleHeight;

  final double phoneWidth;
  final double phoneHeight;

  final BoxFit imageFit;
  final Alignment imageAlignment;

  final bool showDynamicIsland;

  const PhoneMockup({
    super.key,
    required this.imagePath,
    this.visibleHeight = 600,
    this.phoneWidth = 450,
    this.phoneHeight = 920,
    this.imageFit = BoxFit.cover,
    this.imageAlignment = Alignment.topCenter,
    this.showDynamicIsland = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: phoneWidth,
      height: visibleHeight,

      // This cleanly cuts everything below visibleHeight,
      // including border, rounded corners and shadow.
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF101010),
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                color: const Color(0xFF3A3A3A),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 40,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(48),
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
                        margin: const EdgeInsets.only(top: 14),
                        width: 110,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
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
