import 'package:flutter/material.dart';
import '../Widgets/GetToKnowMeWidgetParts/GTKMLeftSideWidget.dart';
import '../Widgets/GetToKnowMeWidgetParts/GTKMRightSideWidget.dart';

class GetToKnowMeWidget extends StatelessWidget {
  const GetToKnowMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30), // Outer padding
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20), // Inner padding
          child: Row(
            children: [
              const Expanded(flex: 1, child: GTKMLeftSideWidget()),

              const SizedBox(width: 20), // space between divider and right side
              const Expanded(flex: 1, child: GTKMRightSideWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
