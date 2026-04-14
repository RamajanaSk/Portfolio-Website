import 'package:flutter/material.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class AppTextStyles {
  static TextStyle name(BuildContext context) {
    final s = AppResponsive.scale(context);

    return TextStyle(
      fontSize: 90 * s,
      fontWeight: FontWeight.w700,
      letterSpacing: 6 * s,
      height: 1.2,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle sectionHeader(BuildContext context) {
    final s = AppResponsive.scale(context);

    return TextStyle(
        fontSize: 42 * s, fontWeight: FontWeight.bold, letterSpacing: 2 * s);
  }

  static TextStyle role(BuildContext context) {
    final s = AppResponsive.scale(context);

    return TextStyle(
      fontSize: 36 * s,
      fontWeight: FontWeight.w700,
      letterSpacing: 4 * s,
    );
  }

  static TextStyle description(BuildContext context) {
    final s = AppResponsive.scale(context);

    return TextStyle(
      fontSize: 18 * s,
      height: 1.5,
      color: Colors.grey,
    );
  }

  static TextStyle small(BuildContext context) {
    final s = AppResponsive.scale(context);

    return TextStyle(
      fontSize: 16 * s,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle smalldescription(BuildContext context) {
    final s = AppResponsive.scale(context);

    return TextStyle(
      fontSize: 18 * s,
      height: 1.7,
      color: Colors.grey,
    );
  }

  static TextStyle projectoverviewtopic(BuildContext context) {
    final s = AppResponsive.scale(context);

    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25 * s,
      height: 1.7,
      letterSpacing: 0.5,
    );
  }

  static TextStyle buttonthick(BuildContext context) {
    final s = AppResponsive.scale(context);

    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14 * s, // slightly smaller, button-like
      color: Colors.white,
      letterSpacing: 0.3,
    );
  }
}
