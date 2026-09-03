import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/phone/phone_mockup.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';
import 'package:ramajana05/data/models/project_feature.dart';

class CoreFeature {
  final String title;
  final String description;
  final String image;

  const CoreFeature({
    required this.title,
    required this.description,
    required this.image,
  });
}

class CoreFeaturesSection extends StatelessWidget {
  final List<ProjectFeature> features;
  final Color accentColor;

  const CoreFeaturesSection({
    super.key,
    required this.features,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    if (features.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1100;

        final columns = isMobile
            ? 1
            : isTablet
                ? 2
                : 3;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
            vertical: isMobile ? 72 : 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeaderText(
                'Core Features',
                label: 'The Experience',
                accentColor: accentColor,
              ),
              SizedBox(
                height: isMobile ? 56 : 80,
              ),
              _FeatureGrid(
                features: features,
                accentColor: accentColor,
                columns: columns,
              ),
            ],
          ),
        );
      },
    );
  }
}

// =====================================================================
// HEADER
// =====================================================================

class _SectionHeader extends StatelessWidget {
  final Color accentColor;
  final bool isMobile;

  const _SectionHeader({
    required this.accentColor,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 720,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Eyebrow
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 2,
                color: accentColor,
              ),
              const SizedBox(width: 12),
              Text(
                'THE EXPERIENCE',
                style: TextStyle(
                  color: colors.onSurface.withValues(alpha: 0.45),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.2,
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Text(
            'Core Features',
            style: TextStyle(
              fontSize: isMobile ? 34 : 46,
              height: 1.05,
              fontWeight: FontWeight.w700,
              letterSpacing: -1.4,
              color: colors.onSurface,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            'A closer look at the interactions and features '
            'that shape the experience.',
            style: TextStyle(
              fontSize: isMobile ? 15 : 17,
              height: 1.65,
              color: colors.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================================
// GRID
// =====================================================================

class _FeatureGrid extends StatelessWidget {
  final List<ProjectFeature> features;
  final Color accentColor;
  final int columns;

  const _FeatureGrid({
    required this.features,
    required this.accentColor,
    required this.columns,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: features.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 40,
        mainAxisSpacing: 72,

        // Phones need vertical room.
        childAspectRatio: columns == 1 ? 0.72 : 0.56,
      ),
      itemBuilder: (context, index) {
        return _FeatureItem(
          feature: features[index],
          index: index,
          accentColor: accentColor,
        );
      },
    );
  }
}

// =====================================================================
// FEATURE
// =====================================================================

class _FeatureItem extends StatelessWidget {
  final ProjectFeature feature;
  final int index;
  final Color accentColor;

  const _FeatureItem({
    required this.feature,
    required this.index,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final number = (index + 1).toString().padLeft(2, '0');

    final hasImage = feature.image != null && feature.image!.trim().isNotEmpty;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors.onSurface.withValues(alpha: 0.07),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // =========================================================
          // BACKGROUND IMAGE
          // =========================================================

          if (hasImage)
            Image.asset(
              feature.image!,
              fit: BoxFit.cover,
            )
          else
            Container(
              color: colors.onSurface.withValues(alpha: 0.025),
            ),

          // =========================================================
          // DARK OVERLAY
          // =========================================================

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.0,
                  0.45,
                  1.0,
                ],
                colors: [
                  colors.surface.withValues(
                    alpha: hasImage ? 0.35 : 0.0,
                  ),
                  colors.surface.withValues(
                    alpha: hasImage ? 0.70 : 0.0,
                  ),
                  colors.surface.withValues(
                    alpha: hasImage ? 0.97 : 0.0,
                  ),
                ],
              ),
            ),
          ),

          // =========================================================
          // SUBTLE ACCENT GLOW
          // =========================================================

          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.10),
                    blurRadius: 80,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),

          // =========================================================
          // CONTENT
          // =========================================================

          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------------------------------------------
                // ICON + NUMBER
                // ---------------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: accentColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: accentColor.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Icon(
                        feature.icon,
                        size: 22,
                        color: accentColor,
                      ),
                    ),
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: colors.onSurface.withValues(alpha: 0.35),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // ---------------------------------------------------
                // TITLE
                // ---------------------------------------------------

                Text(
                  feature.title,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 20,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.4,
                  ),
                ),

                const SizedBox(height: 10),

                // ---------------------------------------------------
                // DESCRIPTION
                // ---------------------------------------------------

                Text(
                  feature.description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: colors.onSurface.withValues(alpha: 0.62),
                  ),
                ),

                const SizedBox(height: 22),

                // ---------------------------------------------------
                // ACCENT LINE
                // ---------------------------------------------------

                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 2,
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: colors.onSurface.withValues(alpha: 0.10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
