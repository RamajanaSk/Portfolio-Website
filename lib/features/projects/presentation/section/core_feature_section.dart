import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/phone/phone_mockup.dart';

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
  final List<CoreFeature> features;

  const CoreFeaturesSection({
    super.key,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1100;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 64,
            vertical: isMobile ? 70 : 110,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Core Features',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40),
              _FeatureGrid(
                features: features,
                columns: isMobile
                    ? 1
                    : isTablet
                        ? 3
                        : 5,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FeatureGrid extends StatelessWidget {
  final List<CoreFeature> features;
  final int columns;

  const _FeatureGrid({
    required this.features,
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
        crossAxisSpacing: 24,
        mainAxisSpacing: 40,

        // Gives enough room for image + text
        childAspectRatio: columns == 1 ? 1.4 : 0.55,
      ),
      itemBuilder: (context, index) {
        return _FeatureCard(
          feature: features[index],
        );
      },
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final CoreFeature feature;

  const _FeatureCard({
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: colors.outlineVariant,
              ),
            ),
            child: PhoneMockup(
              imagePath: feature.image,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          feature.title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          feature.description,
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: colors.onSurface.withValues(
              alpha: 0.6,
            ),
          ),
        ),
      ],
    );
  }
}
