import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ramajana05/core/widgets/bars/topbar/top_bar.dart';

class MainLayoutShell extends StatelessWidget {
  final Widget child;

  const MainLayoutShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'RAMAJANA SKOPLJAK',
        isEnglish: true,
        isDropdownVisible: false,
        onHomePressed: () => context.go('/'),
        onProjectPressed: () => context.go('/projects'),
        onContactPressed: () => context.go('/contact'),
      ),
      body: child,
    );
  }
}
