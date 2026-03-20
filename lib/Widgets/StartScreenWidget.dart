import 'package:flutter/material.dart';
import 'package:ramajana05/Core/theme/appColors.dart';
import '../Widgets/StartScreenWidgetParts/LeftSideWidget.dart';
import '../Widgets/StartScreenWidgetParts/RightSideWidget.dart';

class StartScreenWidget extends StatelessWidget {
  const StartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30), // Outer padding
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black,
            width: 10,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20), // Inner padding
          child: Row(
            children: [
              const Expanded(flex: 1, child: LeftSideWidget()),
              // Custom divider in the middle
              const SizedBox(width: 20), // space between divider and right side
              const Expanded(flex: 1, child: RightSideWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
