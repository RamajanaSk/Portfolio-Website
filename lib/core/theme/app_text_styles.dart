import 'package:flutter/material.dart';

import 'package:ramajana05/core/utils/app_responsive.dart';

class AppTextStyles {
  static double _scale(
    BuildContext context, {
    double min = 0.7,
    double max = 1.2,
  }) {
    return AppResponsive.scale(context).clamp(min, max).toDouble();
  }

  static TextStyle name(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 90 * s,
      fontWeight: FontWeight.w700,
      letterSpacing: 6 * s,
      height: 1.2,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle sectionHeader(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 42 * s,
      fontWeight: FontWeight.bold,
      letterSpacing: 2 * s,
    );
  }

  static TextStyle role(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 36 * s,
      fontWeight: FontWeight.w700,
      letterSpacing: 4 * s,
    );
  }

  static TextStyle description(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 18 * s,
      height: 1.5,
      color: Colors.grey,
    );
  }

  static TextStyle small(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 16 * s,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle smalldescription(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 18 * s,
      height: 1.7,
      color: Colors.grey,
    );
  }

  static TextStyle projectoverviewtopic(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25 * s,
      height: 1.7,
      letterSpacing: 0.5,
    );
  }

  static TextStyle buttonthick(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14 * s,
      color: Colors.white,
      letterSpacing: 0.3,
    );
  }

  static TextStyle buttonoutlined(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14 * s,
      color: Theme.of(context).colorScheme.onSurface,
      letterSpacing: 0.3,
    );
  }

  static TextStyle titleProjectCard(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 22 * s,
      fontWeight: FontWeight.w700,
      letterSpacing: 2 * s,
      height: 1.4,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle descriptionProjectCard(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 22 * s,
      fontWeight: FontWeight.w700,
      letterSpacing: 2 * s,
      height: 1.4,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle metricValue(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 50 * s,
      fontWeight: FontWeight.w900,
      color: Theme.of(context).colorScheme.onSurface,
      height: 1,
    );
  }

  static TextStyle metricTitle(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      fontSize: 16 * s,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle metricSubtitle(BuildContext context) {
    final s = AppResponsive.scale(context).clamp(0.7, 1.2);

    return TextStyle(
      fontSize: 10 * s,
      height: 1.5,
    );
  }

  static TextStyle titleSmaller(BuildContext context) {
    final s = AppResponsive.scale(context).clamp(0.7, 1.2);

    return TextStyle(
      fontSize: 34 * s,
      fontWeight: FontWeight.w800,
      letterSpacing: 1,
    );
  }

  static TextStyle topBarTextButton(BuildContext context) {
    final s = AppResponsive.scale(context).clamp(0.7, 1.2);

    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: 20 * s,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    );
  }

  static TextStyle underSectionTitle(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: 40 * s,
      height: 1.5,
      fontWeight: FontWeight.w900,
      letterSpacing: 5,
    );
  }

  static TextStyle underSectionText(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.72),
      fontSize: 20 * s,
      height: 1.9,
    );
  }

  static TextStyle footerTitleText(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: 14 * s,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle footerText(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
        fontSize: 14 * s);
  }

  static TextStyle fullWidthText(BuildContext context) {
    final s = _scale(context);

    return TextStyle(
        fontSize: 35 * s, color: Colors.white, fontWeight: FontWeight.w800);
  }

  static TextStyle projectName(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
      fontSize: 69 * _scale(context, min: 0.85),
      color: color,
      fontWeight: FontWeight.w700,
      height: 1,
    );
  }
}
