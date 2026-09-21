import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/utils/file_downloader.dart';
import 'package:ramajana05/core/widgets/buttons/gradient_button.dart';
import 'package:ramajana05/core/widgets/buttons/neon_outline_button.dart';
import 'package:ramajana05/core/widgets/social_links_row.dart';
import 'package:ramajana05/core/widgets/text/eyebrow_text.dart';
import 'package:ramajana05/features/home/presentation/widgets/text/animated_role_text.dart';
import 'package:ramajana05/features/home/presentation/widgets/text/tech_stack_text.dart';

class StartHeaderText extends StatefulWidget {
  const StartHeaderText({super.key});

  @override
  State<StartHeaderText> createState() => _StartHeaderTextState();
}

class _StartHeaderTextState extends State<StartHeaderText> {
  bool _showCreative = false;

  @override
  void initState() {
    super.initState();
    _startCreativeAnimation();
  }

  Future<void> _startCreativeAnimation() async {
    while (mounted) {
      // Keep hero clean for a moment
      await Future.delayed(const Duration(seconds: 3));

      if (!mounted) return;

      setState(() {
        _showCreative = true;
      });

      // CREATIVE stays visible
      await Future.delayed(const Duration(milliseconds: 2400));

      if (!mounted) return;

      setState(() {
        _showCreative = false;
      });

      // Small pause before the loop starts again
      await Future.delayed(const Duration(milliseconds: 600));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EyebrowText(
            number: '01',
            text: "HELLO, I'M",
          ),
          const SizedBox(height: 14),

          // ============================================================
          // NAME
          // ============================================================

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

          const SizedBox(height: 20),

          AnimatedRoleText(
            showCreative: _showCreative,
          ),

          const SizedBox(height: 24),

          const TechStackText(),

          const SizedBox(height: 22),

          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(context.l10n.heroSubDescription,
                style: AppTextStyles.description(context)),
          ),

          const SizedBox(height: 22),
          // ============================================================
          // SOCIALS + BUTTONS
          // ============================================================

          const SizedBox(height: 22),

          Row(
            children: [
              const SocialLinksRow(),
              const SizedBox(width: 12),
              Expanded(
                child: _buildButtons(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientButton(
            text: context.l10n.downloadCV,
            onPressed: () {
              FileDownloader.downloadAsset(
                assetPath: 'assets/pdfs/cv.pdf',
                fileName: 'Ramajana_Skopljak_CV.pdf',
              );
            },
          ),
          const SizedBox(width: 12),
          NeonOutlineButton(
            text: context.l10n.viewPortfolio,
            onPressed: () {
              FileDownloader.openAsset(
                assetPath: 'assets/pdfs/software_portfolio.pdf',
              );
            },
          ),
        ],
      ),
    );
  }
}
