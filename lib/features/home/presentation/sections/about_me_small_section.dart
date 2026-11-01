import 'package:flutter/material.dart';

import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/extensions/responsive_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/buttons/text_with_icon_button.dart';
import 'package:ramajana05/core/widgets/info_chip.dart';
import 'package:ramajana05/core/widgets/responsive.dart/responsive_two_column_layout.dart';
import 'package:ramajana05/core/widgets/text/eyebrow_text.dart';

class AboutMeSmallSection extends StatelessWidget {
  final VoidCallback onAboutMePressed;

  const AboutMeSmallSection({
    super.key,
    required this.onAboutMePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 24 : 40,
        vertical: context.isMobile ? 60 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1440,
          ),
          child: ResponsiveTwoColumnLayout(
            first: _buildImage(
              context,
              isMobile: context.isMobile,
            ),
            second: _buildText(context),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // IMAGE
  // ============================================================

  Widget _buildImage(
    BuildContext context, {
    required bool isMobile,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // --------------------------------------------------------
        // OFFSET OUTLINE
        // --------------------------------------------------------

        Positioned(
          left: isMobile ? -10 : -18,
          top: isMobile ? 12 : 18,
          right: isMobile ? 10 : 18,
          bottom: isMobile ? -12 : -18,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: colorScheme.primary.withValues(
                  alpha: 0.22,
                ),
                width: 1.2,
              ),
            ),
          ),
        ),

        // --------------------------------------------------------
        // PHOTO
        // --------------------------------------------------------

        AspectRatio(
          aspectRatio: 380 / 470,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/me_cv.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // TEXT CONTENT
  // ============================================================

  Widget _buildText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EyebrowText(
          number: '02',
          text: context.l10n.aboutMe,
        ),

        const SizedBox(height: 24),

        // --------------------------------------------------------
        // DESCRIPTION
        // --------------------------------------------------------

        Text(
          context.l10n.aboutMeDescription,
          style: AppTextStyles.underSectionText(context).copyWith(
            height: 1.7,
          ),
        ),

        const SizedBox(height: 30),

        // --------------------------------------------------------
        // SKILLS
        // --------------------------------------------------------

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            InfoChip(
              text: context.l10n.mobileComputing,
            ),
            InfoChip(
              text: context.l10n.uiFocused,
            ),
            InfoChip(
              text: context.l10n.flutterDeveloper,
            ),
            InfoChip(
              text: context.l10n.crossPlatform,
            ),
          ],
        ),

        const SizedBox(height: 34),

        TextWithIconButton(
          text: context.l10n.moreAboutMe,
          onPressed: onAboutMePressed,
        ),
      ],
    );
  }
}
