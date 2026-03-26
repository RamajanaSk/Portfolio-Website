import 'package:flutter/material.dart';
import 'package:ramajana05/Core/theme/app_theme.dart';
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
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.system,
      home: const MainLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
