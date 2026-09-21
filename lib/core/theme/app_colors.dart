import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  bool get isDark =>
      Theme.of(this as BuildContext).brightness == Brightness.dark;

  Color get pinkGlow =>
      isDark ? const Color(0xFFFF2D95) : const Color(0xFFFF7AB8);

  Color get blueGlow =>
      isDark ? const Color(0xFF00CFFF) : const Color(0xFF5EDCFF);

  Color get purpleGlow =>
      isDark ? const Color(0xFF6A00FF) : const Color(0xFFB388FF);

  Color get backgroundPure => isDark ? const Color(0xFF020203) : Colors.white;

  static const pink = Color(0xFFFF2D95);

  static const backgroundLight = Color(0xFFFFFFFF);
  static const backgroundDark = Color.fromARGB(255, 12, 12, 12);
  static const backgroundCard = Colors.white;

  // BRAND COLORS
  static const logoBlue = Color(0xFF3196FE);
  static const logoLightPurple = Color(0xFFB620E4);
  static const logoPurple = Color(0xFF6857FC);
  static const logoRed = Color(0xFFF65165);

  // NEUTRALS
  static const Textwhite = Colors.white;
  static const Textblack = Colors.black;

  // SHADOWS
  static const cardShadow = Color(0xFF919191);

  // STATUS COLORS
  static const warningRed = Color(0xFFFF4242);

  // INPUT
  static const textfieldGrey = Color(0xFF353535);
  static const textfieldWhite = Color(0xFFEDEDED);

  // OPACITY VARIANTS
  static const logoBlue50 = Color(0x803196FE);
  static const logoLightPurple50 = Color(0x80B620E4);
  static const logoPurple50 = Color(0x806857FC);
  static const logoRed50 = Color(0x80F65165);

  static var primary = const Color(0x806857FC);

  static const vibrantPink = Color(0xFFFF2D95);

  //Color(0xFFFF2D95),
  //Color(0xFF8A2BE2),
  //Color(0xFF00CFFF),
}
