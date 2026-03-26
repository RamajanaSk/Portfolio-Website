import 'package:flutter/material.dart';
import 'package:ramajana05/features/home/widgets/start_header_text.dart';
import 'package:ramajana05/features/home/widgets/start_header_picture.dart';

class StartSection extends StatelessWidget {
  const StartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 900;

        if (isMobile) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              GTKMLeftSideWidget(),
              SizedBox(height: 40),
              GTKMRightSideWidget(),
            ],
          );
        } else {
          return Row(
            children: const [
              Expanded(child: GTKMRightSideWidget()),
              Expanded(child: GTKMLeftSideWidget()),
            ],
          );
        }
      },
    );
  }
}
