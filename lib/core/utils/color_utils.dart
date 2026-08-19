import 'package:flutter/material.dart';

class ColorUtils {
  ColorUtils._();

  static const Color fallbackColor = Color(0xFF8064E8);

  /// Converts a hex string such as:
  /// #8064E8
  /// 8064E8
  ///
  /// into a Flutter [Color].
  static Color fromHex(
    String hexColor, {
    Color fallback = fallbackColor,
  }) {
    var hex = hexColor.replaceAll('#', '').trim();

    if (hex.length != 6) {
      return fallback;
    }

    try {
      return Color(
        int.parse('FF$hex', radix: 16),
      );
    } catch (_) {
      return fallback;
    }
  }
}
