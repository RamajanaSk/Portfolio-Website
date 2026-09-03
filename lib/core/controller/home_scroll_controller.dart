import 'package:flutter/material.dart';

class HomeScrollController {
  HomeScrollController._();

  static final ScrollController controller = ScrollController();

  static void scrollToTop() {
    if (!controller.hasClients) {
      debugPrint('HomeScrollController: no clients attached');
      return;
    }

    debugPrint(
      'HomeScrollController: scrolling from ${controller.offset} to 0',
    );

    controller.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }
}
