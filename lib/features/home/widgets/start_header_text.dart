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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SocialLinksRow(),
                SizedBox(width: 12), // control gap here
                _buildButtons(),
              ],
            ),
          ],
        ));
  }

  Widget _buildButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Gradient Button (Download CV)
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFF2D95), // pink
                Color(0xFF8A2BE2), // purple
              ],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFFF2D95).withOpacity(0.4),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Download CV",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Outline Neon Button (Portfolio)
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
            ),
            side: const BorderSide(
              color: Color(0xFF8A2BE2),
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            foregroundColor: const Color(0xFF8A2BE2),
          ),
          child: const Text(
            "View Portfolio →",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
