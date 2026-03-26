import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/decorative_line.dart';
import 'package:ramajana05/core/widgets/social_links_row.dart';

class GTKMLeftSideWidget extends StatelessWidget {
  const GTKMLeftSideWidget({super.key});

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
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                'RAMAJANA',
                style: AppTextStyles.name(context),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                'SKOPLJAK',
                style: AppTextStyles.name(context),
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Row(
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
            ),
            SizedBox(height: 20),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                  'FLUTTER • MOBILE • INTERACTIVE EXPERIENCES\nBUILDING PERFORMANT, USER-FOCUSED APPLICATIONS.',
                  style: AppTextStyles.description(context)),
            ),
            const SizedBox(height: 20),
            SocialLinksRow(),
          ],
        ));
  }
}
