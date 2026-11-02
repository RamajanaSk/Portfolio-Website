import 'package:flutter/material.dart';

import 'package:ramajana05/core/widgets/background/responsive_dot_grid_background.dart';
import 'package:ramajana05/core/widgets/responsive.dart/responsive_layout.dart';
import 'package:ramajana05/features/home/presentation/widgets/start_header_picture.dart';
import 'package:ramajana05/features/home/presentation/widgets/start_header_text.dart';

class StartSection extends StatelessWidget {
  final VoidCallback onAboutMePressed;

  const StartSection({
    super.key,
    required this.onAboutMePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        const ResponsiveDotGridBackground(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ResponsiveLayout(
            mobile: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                StartHeaderText(
                  onAboutMePressed: onAboutMePressed,
                ),
                const SizedBox(height: 40),
                const StartHeaderPicture(),
              ],
            ),
            desktop: Row(
              children: [
                const Expanded(
                  child: StartHeaderPicture(),
                ),
                Expanded(
                  child: StartHeaderText(
                    onAboutMePressed: onAboutMePressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
