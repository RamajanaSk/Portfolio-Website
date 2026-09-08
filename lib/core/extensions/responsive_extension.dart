import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  static const double _mobileBreakpoint = 900;
  static const double _largeDesktopBreakpoint = 1200;

  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  bool get isMobile => screenWidth < _mobileBreakpoint;

  bool get isDesktop =>
      screenWidth >= _mobileBreakpoint && screenWidth < _largeDesktopBreakpoint;

  bool get isLargeDesktop => screenWidth >= _largeDesktopBreakpoint;
}
