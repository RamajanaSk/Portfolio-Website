import 'package:flutter/material.dart';
import 'package:ramajana05/Core/theme/app_theme.dart'; // 👈 your theme file
import 'package:ramajana05/mainLayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAMAJANA05',

      theme: getLightTheme(), // ✅ light theme
      darkTheme: getDarkTheme(), // ✅ dark theme

      themeMode: ThemeMode.system, // ✅ auto switch

      home: const MainLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
