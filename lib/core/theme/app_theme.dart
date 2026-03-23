import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_colors.dart';

ThemeData getLightTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
  );

  return ThemeData(
    brightness: Brightness.light,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        color: colorScheme.onSurface,
      ),
    ),
  );
}

ThemeData getDarkTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.dark,
  );

  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        color: colorScheme.onSurface,
      ),
    ),
  );
}
