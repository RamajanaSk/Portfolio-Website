import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/Project.dart';
import 'package:ramajana05/core/extensions/hexcolor.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/features/projects/presentation/widget/technology_chip.dart';

class HeroSection extends StatelessWidget {
  final Project project;

  const HeroSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Container(
              color: project.hexcolor.toColor(),
            ),
          ),

          // Dark overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context)
                        .colorScheme
                        .surface
                        .withValues(alpha: 0.97),
                    Theme.of(context)
                        .colorScheme
                        .surface
                        .withValues(alpha: 0.37),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 60,
              ),
              child: isMobile ? _buildMobile() : _buildDesktop(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDesktop() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: _HeroInformation(project),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 6,
          child: _HeroPreview(project),
        ),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      children: [
        _HeroInformation(project),
        const SizedBox(height: 40),
        Expanded(
          child: _HeroPreview(project),
        ),
      ],
    );
  }
}

class _HeroInformation extends StatelessWidget {
  final Project project;

  const _HeroInformation(this.project);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          project.name,
          style: AppTextStyles.projectName(
            context,
            color: project.hexcolor.toColor(),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          project.subtitle,
          style: AppTextStyles.projectSubtitle(context),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 500,
          child: Text(
            project.shortDescription,
            style: AppTextStyles.projectShortDescription(context),
          ),
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: project.technologies
              .take(3)
              .map(
                (tech) => TechnologyChip(
                  technology: tech,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            SizedBox(
              height: 52,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: project.hexcolor.toColor(),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // instead of 20+
                  ),
                ),
                onPressed: () {},
                child: Text(
                  context.l10n.github,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(
                    color: Colors.white.withOpacity(.25),
                    width: 1.2,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  context.l10n.demo,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroPreview extends StatelessWidget {
  final Project project;

  const _HeroPreview(this.project);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 900;

    if (project.phoneMockup.isEmpty) {
      return const SizedBox.shrink();
    }

    // Desktop: Portrait
    final double phoneHeight =
        isMobile ? size.width * 0.82 : size.height * 0.78;

    final double phoneWidth = phoneHeight * 0.485;

    final phone = Container(
      width: phoneWidth,
      height: phoneHeight,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(42),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 40,
            spreadRadius: 4,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // APP SCREEN
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(34),
              child: Image.asset(
                project.phoneMockup,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // CAMERA
          Positioned(
            top: 10,
            child: Container(
              width: 85,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );

    return Center(
      child: isMobile
          ? RotatedBox(
              quarterTurns: 1,
              child: phone,
            )
          : phone,
    );
  }
}
