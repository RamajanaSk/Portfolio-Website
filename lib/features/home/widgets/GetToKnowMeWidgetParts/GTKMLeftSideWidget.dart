import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/decorative_line.dart';
import 'package:ramajana05/core/widgets/social_links_row.dart';

class GTKMLeftSideWidget extends StatefulWidget {
  const GTKMLeftSideWidget({super.key});

  @override
  State<GTKMLeftSideWidget> createState() => _GTMKLeftSideWidgetState();
}

class _GTMKLeftSideWidgetState extends State<GTKMLeftSideWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecorativeLine(
              leftColor: Theme.of(context).colorScheme.onSurface,
              rightColor: const Color(0xFFFF2D95),
            ),
            const SizedBox(height: 6),
            Text('RAMAJANA', style: AppTextStyles.name(context)),
            Text('SKOPLJAK', style: AppTextStyles.name(context)),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'CREATIVE ',
                  style: AppTextStyles.role(context).copyWith(
                    color: AppColors.pink,
                  ),
                ),
                Text(
                  'DEVELOPER',
                  style: AppTextStyles.role(context),
                ),
              ],
            ),
            SizedBox(height: 20),
            const Text(
              'FLUTTER • MOBILE • INTERACTIVE EXPERIENCES\nBUILDING PERFORMANT, USER-FOCUSED APPLICATIONS.',
              style: TextStyle(
                fontSize: 18,
                height: 1.7,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            SocialLinksRow(),
          ],
        ));
  }
}
