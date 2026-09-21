import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/text/line_and_text.dart';
import 'package:ramajana05/data/models/project.dart';
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
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 900;
    final accent = project.hexcolor.toColor();
    final surface = Theme.of(context).colorScheme.surface;

    return Container(
      constraints: BoxConstraints(
        minHeight: size.height,
      ),
      decoration: BoxDecoration(
        color: surface,
        gradient: RadialGradient(
          center: const Alignment(0.8, 0.1),
          radius: 1.1,
          colors: [
            accent.withValues(alpha: 0.16),
            surface.withValues(alpha: 0.98),
            surface,
          ],
          stops: const [0, 0.48, 1],
        ),
      ),
      child: Stack(
        children: [
          if (!isMobile)
            Positioned(
              right: 55,
              top: 25,
              child: IgnorePointer(
                child: Text(
                  '01',
                  style: TextStyle(
                    fontSize: 190,
                    height: 1,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -12,
                    color: Colors.white.withValues(alpha: 0.025),
                  ),
                ),
              ),
            ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accent,
                    accent.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: isMobile ? 40 : 60,
              ),
              child: isMobile ? _buildMobile(context) : _buildDesktop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: _HeroInformation(project),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 5,
          child: _HeroPreview(project),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroInformation(project),
        const SizedBox(height: 56),
        SizedBox(
          height: 520,
          width: double.infinity,
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
    final accent = project.hexcolor.toColor();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineAndText(
          project: project,
          accent: accent,
        ),
        const SizedBox(height: 24),
        Text(
          project.name,
          style: AppTextStyles.projectName(
            context,
            color: accent,
          ),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 580,
          ),
          child: Text(
            project.subtitle,
            style: AppTextStyles.projectSubtitle(context),
          ),
        ),
        const SizedBox(height: 28),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 520,
          ),
          child: Text(
            project.shortDescription,
            style: AppTextStyles.projectShortDescription(context),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: project.technologies
              .take(4)
              .map(
                (tech) => TechnologyChip(
                  technology: tech,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 42),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            SizedBox(
              height: 50,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.github,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_outward_rounded,
                      size: 17,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(
                    color: Colors.white.withValues(alpha: 0.18),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.demo,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.play_arrow_rounded,
                      size: 18,
                      color: accent,
                    ),
                  ],
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
    final accent = project.hexcolor.toColor();

    if (project.phoneMockup.isEmpty) {
      return const SizedBox.shrink();
    }

    final double phoneHeight =
        isMobile ? 480 : (size.height * 0.72).clamp(500.0, 720.0);

    final double phoneWidth = phoneHeight * 0.485;

    return Center(
      child: SizedBox(
        width: isMobile ? phoneWidth + 80 : double.infinity,
        height: phoneHeight + 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ---------------------------------------------------------
            // SUBTLE GLOW
            // ---------------------------------------------------------

            Container(
              width: phoneWidth * 1.2,
              height: phoneHeight * 0.82,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.18),
                    blurRadius: 100,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),

            Positioned(
              right: 0,
              top: 80,
              child: Container(
                width: isMobile ? 60 : 140,
                height: 1,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),

            Positioned(
              left: 0,
              bottom: 110,
              child: Container(
                width: isMobile ? 50 : 110,
                height: 1,
                color: accent.withValues(alpha: 0.4),
              ),
            ),

            Container(
              width: phoneWidth,
              height: phoneHeight,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: const Color(0xFF101010),
                borderRadius: BorderRadius.circular(42),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.14),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 45,
                    offset: const Offset(0, 25),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset(
                        project.phoneMockup,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 11,
                    child: Container(
                      width: 82,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (!isMobile)
              Positioned(
                right: 5,
                bottom: 70,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'MOBILE EXPERIENCE  /  2026',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.1,
                      color: Colors.white.withValues(alpha: 0.28),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
