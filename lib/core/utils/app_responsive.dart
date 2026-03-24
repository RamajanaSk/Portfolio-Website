// lib/core/utils/app_responsive.dart

import 'package:flutter/material.dart';

class AppResponsive {
  static double scale(BuildContext context,
      {double min = 0.4, double max = 1.0}) {
    final width = MediaQuery.of(context).size.width;
    const baseWidth = 1400;

    return (width / baseWidth).clamp(min, max);
  }
}
