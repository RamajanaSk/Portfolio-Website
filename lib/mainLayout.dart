import 'package:flutter/material.dart';

import 'package:ramajana05/core/widgets/bars/topbar/top_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final bool _isMenuVisible = false;

  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'RAMAJANA SKOPLJAK',
        isEnglish: isEnglish,
        isDropdownVisible: _isMenuVisible,
        onGermanPressed: () {
          setState(() {
            isEnglish = false;
          });
        },
        onEnglishPressed: () {
          setState(() {
            isEnglish = true;
          });
        },
      ),
    );
  }
}
