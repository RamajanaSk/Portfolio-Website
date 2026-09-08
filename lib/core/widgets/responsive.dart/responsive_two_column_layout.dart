import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/responsive_extension.dart';

class ResponsiveTwoColumnLayout extends StatelessWidget {
  final Widget first;
  final Widget second;

  final double desktopFirstWidth;
  final double largeDesktopFirstWidth;

  final double desktopSpacing;
  final double largeDesktopSpacing;
  final double mobileSpacing;

  final double mobileFirstMaxWidth;

  final CrossAxisAlignment mobileCrossAxisAlignment;
  final CrossAxisAlignment desktopCrossAxisAlignment;

  const ResponsiveTwoColumnLayout({
    super.key,
    required this.first,
    required this.second,
    this.desktopFirstWidth = 320,
    this.largeDesktopFirstWidth = 380,
    this.desktopSpacing = 60,
    this.largeDesktopSpacing = 90,
    this.mobileSpacing = 55,
    this.mobileFirstMaxWidth = 400,
    this.mobileCrossAxisAlignment = CrossAxisAlignment.start,
    this.desktopCrossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return Column(
        crossAxisAlignment: mobileCrossAxisAlignment,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: mobileFirstMaxWidth,
              ),
              child: first,
            ),
          ),
          SizedBox(height: mobileSpacing),
          second,
        ],
      );
    }

    final isLargeDesktop = context.isLargeDesktop;

    return Row(
      crossAxisAlignment: desktopCrossAxisAlignment,
      children: [
        SizedBox(
          width: isLargeDesktop ? largeDesktopFirstWidth : desktopFirstWidth,
          child: first,
        ),
        SizedBox(
          width: isLargeDesktop ? largeDesktopSpacing : desktopSpacing,
        ),
        Expanded(
          child: second,
        ),
      ],
    );
  }
}
