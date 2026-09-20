import 'dart:ui';

import 'package:flutter/material.dart';

class AppResponsive {
  static double fluidValue(
    BuildContext context, {
    required double min,
    required double max,
    double minWidth = 360,
    double maxWidth = 1200,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    final progress =
        ((width - minWidth) / (maxWidth - minWidth)).clamp(0.0, 1.0);

    return lerpDouble(min, max, progress)!;
  }

  static double fluidFontSize(
    BuildContext context, {
    required double min,
    required double max,
    double minWidth = 360,
    double maxWidth = 1200,
  }) {
    return fluidValue(
      context,
      min: min,
      max: max,
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
  }

  static double scale(
    BuildContext context, {
    double minScale = 0.7,
    double maxScale = 1.2,
    double minWidth = 360,
    double maxWidth = 1600,
  }) {
    return fluidValue(
      context,
      min: minScale,
      max: maxScale,
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
  }

  static double fontSize(
    BuildContext context, {
    required double min,
    required double max,
    double minWidth = 360,
    double maxWidth = 1600,
  }) {
    return fluidFontSize(
      context,
      min: min,
      max: max,
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
  }
}
