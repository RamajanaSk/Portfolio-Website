import 'package:flutter/material.dart';

import 'package:ramajana05/core/widgets/background/responsive_dot_grid_background.dart';
import 'package:ramajana05/core/widgets/responsive.dart/responsive_layout.dart';
import 'package:ramajana05/features/home/presentation/widgets/start_header_picture.dart';
import 'package:ramajana05/features/home/presentation/widgets/start_header_text.dart';

class StartSection extends StatelessWidget {
  const StartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return const Stack(
          fit: StackFit.passthrough,
          children: [
            ResponsiveDotGridBackground(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: ResponsiveLayout(
                mobile: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    StartHeaderText(),
                    SizedBox(height: 40),
                    StartHeaderPicture(),
                  ],
                ),
                desktop: Row(
                  children: [
                    Expanded(
                      child: StartHeaderPicture(),
                    ),
                    Expanded(
                      child: StartHeaderText(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
