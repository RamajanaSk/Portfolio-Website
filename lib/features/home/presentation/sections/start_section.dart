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

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: isMobile
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    GTKMLeftSideWidget(),
                    SizedBox(height: 40),
                    GTKMRightSideWidget(),
                  ],
                )
              : const Row(
                  children: [
                    Expanded(
                      child: GTKMRightSideWidget(),
                    ),
                    Expanded(
                      child: GTKMLeftSideWidget(),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
