import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ramajana05/core/controller/home_scroll_controller.dart';
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
        onHomePressed: () {
          final path = GoRouterState.of(context).uri.path;

          debugPrint('HOME CLICKED');
          debugPrint('Current path: $path');

          if (path == '/') {
            HomeScrollController.scrollToTop();
          } else {
            context.go('/');
          }
        },
        onProjectPressed: () {
          context.go('/projects');
        },
        onContactPressed: () {
          context.go('/contact');
        },
      ),
      body: child,
    );
  }
}
