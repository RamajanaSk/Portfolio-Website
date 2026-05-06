import 'package:flutter/material.dart';
import 'package:ramajana05/features/home/presentation/widgets/start_header_picture.dart';
import 'package:ramajana05/features/home/presentation/widgets/start_header_text.dart';

class StartSection extends StatelessWidget {
  const StartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 900;

        if (isMobile) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GTKMLeftSideWidget(),
              SizedBox(height: 40),
              GTKMRightSideWidget(),
            ],
          );
        } else {
          return const Row(
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
