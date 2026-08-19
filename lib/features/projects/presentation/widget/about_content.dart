import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/core/utils/color_utils.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';
import 'package:ramajana05/features/projects/presentation/widget/item/featured_item.dart';
import 'package:ramajana05/l10n/app_localizations.dart';

class AboutContent extends StatelessWidget {
  final Project project;

  const AboutContent({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final projectColor = ColorUtils.fromHex(project.hexcolor);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // =====================================================
        // HEADER
        // =====================================================

        SectionHeaderText(
          '${AppLocalizations.of(context)!.about} ${project.name}',
        ),

        const SizedBox(height: 18),

        // =====================================================
        // DESCRIPTION
        // =====================================================

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 620,
          ),
          child: Text(
            project.shortDescription,
            style: const TextStyle(
              fontSize: 15,
              height: 1.7,
              color: Color(0xFF55536A),
            ),
          ),
        ),

        // =====================================================
        // FEATURES
        // =====================================================

        if (project.features.isNotEmpty) ...[
          const SizedBox(height: 30),
          const Divider(
            color: Color(0xFFEAE8F1),
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 550;

              const horizontalSpacing = 30.0;
              const verticalSpacing = 32.0;

              final itemWidth = isMobile
                  ? constraints.maxWidth
                  : (constraints.maxWidth - horizontalSpacing * 2) / 3;

              return Wrap(
                spacing: horizontalSpacing,
                runSpacing: verticalSpacing,
                children: [
                  for (final feature in project.features)
                    SizedBox(
                      width: itemWidth,
                      child: FeatureItem(
                        icon: feature.icon,
                        title: feature.title,
                        description: feature.description,
                        color: projectColor,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ],
    );
  }
}
