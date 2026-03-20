import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ramajana05/Core/theme/appColors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
  );
}
