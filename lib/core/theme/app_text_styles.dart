import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle title(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onSurface,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
  }

  static TextStyle description(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onSurface.withOpacity(0.8),
      fontSize: 14,
    );
  }

  static TextStyle nav(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyLarge!.copyWith(
      color: theme.colorScheme.onSurface,
      fontWeight: FontWeight.bold,
      fontSize: 19,
    );
  }

  static TextStyle overlay(BuildContext context) {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 2),
      ],
    );
  }
}
