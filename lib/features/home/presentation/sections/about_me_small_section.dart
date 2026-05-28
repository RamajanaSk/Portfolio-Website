import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/info_chip.dart';

class AboutMeSmallSection extends StatelessWidget {
  final VoidCallback onAboutMePressed;

  const AboutMeSmallSection({
    super.key,
    required this.onAboutMePressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 40,
        bottom: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImage(),
                    const SizedBox(height: 30),
                    _buildText(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImage(),
                    const SizedBox(width: 60),
                    Expanded(child: _buildText(context)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.aboutMe,
            style: AppTextStyles.underSectionTitle(
              context,
            )),
        const SizedBox(height: 32),
        Text(
          context.l10n.aboutMeDescription,
          style: AppTextStyles.underSectionText(context),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 18,
          runSpacing: 18,
          children: [
            InfoChip(context.l10n.mobileComputing),
            InfoChip(context.l10n.uiFocused),
            InfoChip(context.l10n.flutterDeveloper),
            InfoChip(context.l10n.crossPlatform),
          ],
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      width: 400,
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage("assets/me_cv.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
