import 'package:flutter/material.dart';

class BackgroundSectionText extends StatelessWidget {
  final String text;
  final bool isMobile;

  final double left;
  final double? right;
  final double? top;
  final double? bottom;

  final double mobileFontSize;
  final double desktopFontSize;
  final double opacity;
  final double letterSpacing;

  const BackgroundSectionText({
    super.key,
    required this.text,
    required this.isMobile,
    this.left = -20,
    this.right,
    this.top,
    this.bottom = -35,
    this.mobileFontSize = 110,
    this.desktopFontSize = 220,
    this.opacity = 0.018,
    this.letterSpacing = -8,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Positioned(
      left: right == null ? left : null,
      right: right,
      top: top,
      bottom: bottom,
      child: IgnorePointer(
        child: ExcludeSemantics(
          child: Text(
            text.toUpperCase(),
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
              color: colorScheme.onSurface.withValues(
                alpha: opacity,
              ),
              fontSize: isMobile ? mobileFontSize : desktopFontSize,
              height: 1,
              fontWeight: FontWeight.w900,
              letterSpacing: letterSpacing,
            ),
          ),
        ),
      ),
    );
  }
}
