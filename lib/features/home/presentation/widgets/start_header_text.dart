import 'dart:async';

import 'package:flutter/material.dart';

import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/utils/file_downloader.dart';
import 'package:ramajana05/core/widgets/social_links_row.dart';
import 'package:ramajana05/core/widgets/text/eyebrow_text.dart';
import 'package:ramajana05/core/widgets/text/section_header.dart';
import 'package:ramajana05/features/home/presentation/widgets/text/animated_role_text.dart';
import 'package:ramajana05/features/home/presentation/widgets/text/tech_stack_text.dart';
import 'package:ramajana05/l10n/app_localizations.dart';

class StartHeaderText extends StatefulWidget {
  final VoidCallback onAboutMePressed;

  const StartHeaderText({
    super.key,
    required this.onAboutMePressed,
  });

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
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;

      setState(() => _showCreative = true);

      await Future.delayed(
        const Duration(milliseconds: 2400),
      );
      if (!mounted) return;

      setState(() => _showCreative = false);

      await Future.delayed(
        const Duration(milliseconds: 600),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ----------------------------------------
              // INTRO
              // ----------------------------------------

              SectionHeader(
                number: '01',
                title: context.l10n.helloIm.toUpperCase(),
                accentColor: AppColors.pink,
              ),

              const SizedBox(height: 14),

              // ----------------------------------------
              // NAME
              // ----------------------------------------

              _buildName(context, 'RAMAJANA'),
              _buildName(context, 'SKOPLJAK'),

              const SizedBox(height: 20),

              // ----------------------------------------
              // ANIMATED ROLE
              // ----------------------------------------

              AnimatedRoleText(
                showCreative: _showCreative,
              ),

              const SizedBox(height: 24),

              const TechStackText(),

              const SizedBox(height: 22),

              // ----------------------------------------
              // DESCRIPTION
              // ----------------------------------------

              Text(
                context.l10n.heroSubDescription,
                style: AppTextStyles.description(context),
              ),

              const SizedBox(height: 30),

              // ----------------------------------------
              // ACTION BUTTONS
              // ----------------------------------------

              _buildActionButtons(context),

              const SizedBox(height: 28),

              // ----------------------------------------
              // SOCIAL LINKS
              // ----------------------------------------

              const SocialLinksRow(),
            ],
          ),
        );
      },
    );
  }

  // ============================================
  // NAME
  // ============================================

  Widget _buildName(BuildContext context, String name) {
    return SizedBox(
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: AppTextStyles.name(context),
        ),
      ),
    );
  }

  // ============================================
  // ACTION BUTTONS
  // ============================================

  Widget _buildActionButtons(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // ----------------------------------------
        // MORE ABOUT ME - PRIMARY CTA
        // ----------------------------------------

        FilledButton.icon(
          onPressed: widget.onAboutMePressed,
          iconAlignment: IconAlignment.end,
          icon: const Icon(
            Icons.arrow_outward_rounded,
            size: 19,
          ),
          label: const Text(
            'More About Me',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.pink,
            foregroundColor: colors.onPrimary,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        // ----------------------------------------
        // CV BUTTON
        // ----------------------------------------

        OutlinedButton(
          onPressed: () {
            FileDownloader.downloadAsset(
              assetPath: 'assets/pdfs/cv.pdf',
              fileName: 'Ramajana_Skopljak_CV.pdf',
            );
          },
          style: _documentButtonStyle(colors),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.description_outlined,
                size: 19,
              ),
              const SizedBox(width: 8),
              Text(AppLocalizations.of(context)!.downloadCV),
              const SizedBox(width: 8),
              const Icon(
                Icons.download_rounded,
                size: 15,
              ),
            ],
          ),
        ),

        // ----------------------------------------
        // PORTFOLIO BUTTON
        // ----------------------------------------

        OutlinedButton(
          onPressed: () {
            FileDownloader.openAsset(
              assetPath: 'assets/pdfs/software_portfolio.pdf',
            );
          },
          style: _documentButtonStyle(colors),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.folder_open_outlined,
                size: 19,
              ),
              const SizedBox(width: 8),
              Text(AppLocalizations.of(context)!.viewPortfolio),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_outward_rounded,
                size: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================
  // DOCUMENT BUTTON STYLE
  // ============================================

  ButtonStyle _documentButtonStyle(ColorScheme colors) {
    return OutlinedButton.styleFrom(
      foregroundColor: colors.onSurface,
      side: BorderSide(
        color: colors.outline.withValues(alpha: 0.45),
        width: 1,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 20,
      ),
      textStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
