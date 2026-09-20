import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';
import 'package:ramajana05/core/widgets/buttons/project_button.dart';

class ProjectCtaContent extends StatelessWidget {
  final Color accent;
  final VoidCallback? onGithubPressed;
  final VoidCallback? onDemoPressed;

  const ProjectCtaContent({
    super.key,
    required this.accent,
    this.onGithubPressed,
    this.onDemoPressed,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = AppResponsive.fluidValue(
      context,
      min: 24,
      max: 80,
    );

    final verticalPadding = AppResponsive.fluidValue(
      context,
      min: 65,
      max: 90,
    );

    final labelSpacing = AppResponsive.fluidValue(
      context,
      min: 26,
      max: 32,
    );

    final descriptionSpacing = AppResponsive.fluidValue(
      context,
      min: 20,
      max: 24,
    );

    final buttonSpacing = AppResponsive.fluidValue(
      context,
      min: 32,
      max: 40,
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SectionLabel(accent: accent),
              SizedBox(height: labelSpacing),
              Text(
                'Don\'t just read about it.',
                textAlign: TextAlign.center,
                style: AppTextStyles.projectCtaTitle(context),
              ),
              const SizedBox(height: 8),
              Text(
                'Experience it.',
                textAlign: TextAlign.center,
                style: AppTextStyles.projectCtaAccentTitle(
                  context,
                  color: accent,
                ),
              ),
              SizedBox(height: descriptionSpacing),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 570),
                child: Text(
                  'Explore the code, try the project yourself, '
                  'or take a closer look at how it was built.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.projectCtaDescription(context),
                ),
              ),
              SizedBox(height: buttonSpacing),
              _ProjectCtaActions(
                accent: accent,
                onDemoPressed: onDemoPressed,
                onGithubPressed: onGithubPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final Color accent;

  const _SectionLabel({
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final lineWidth = AppResponsive.fluidValue(
      context,
      min: 18,
      max: 24,
    );

    final spacing = AppResponsive.fluidValue(
      context,
      min: 8,
      max: 12,
    );

    Widget line() {
      return Container(
        width: lineWidth,
        height: 1,
        color: accent,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        line(),
        SizedBox(width: spacing),
        Text(
          'TRY IT YOURSELF',
          style: AppTextStyles.projectCtaLabel(
            context,
            color: accent,
          ),
        ),
        SizedBox(width: spacing),
        line(),
      ],
    );
  }
}

class _ProjectCtaActions extends StatelessWidget {
  final Color accent;
  final VoidCallback? onGithubPressed;
  final VoidCallback? onDemoPressed;

  const _ProjectCtaActions({
    required this.accent,
    this.onGithubPressed,
    this.onDemoPressed,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = AppResponsive.fluidValue(
      context,
      min: 10,
      max: 14,
    );

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: spacing,
      runSpacing: spacing,
      children: [
        if (onDemoPressed != null)
          ProjectButton(
            text: 'TRY THE PROJECT',
            icon: Icons.arrow_outward_rounded,
            accent: accent,
            filled: true,
            onPressed: onDemoPressed!,
          ),
        if (onGithubPressed != null)
          ProjectButton(
            text: 'VIEW SOURCE',
            icon: Icons.code_rounded,
            accent: accent,
            filled: false,
            onPressed: onGithubPressed!,
          ),
      ],
    );
  }
}
