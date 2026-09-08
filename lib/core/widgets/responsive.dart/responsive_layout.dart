import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/responsive_extension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget? largeDesktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.desktop,
    this.largeDesktop,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isLargeDesktop) {
      return largeDesktop ?? desktop;
    }

    if (context.isDesktop) {
      return desktop;
    }

    return mobile;
  }
}
