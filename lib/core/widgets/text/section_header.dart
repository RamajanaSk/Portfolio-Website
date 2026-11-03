import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/widgets/divider/accent_divider.dart';
import 'package:ramajana05/core/widgets/text/eyebrow_text.dart';

class SectionHeader extends StatelessWidget {
  final String number;
  final String title;
  final Color accentColor;
  final double spacing;
  final bool showDivider;

  const SectionHeader({
    super.key,
    required this.number,
    required this.title,
    this.accentColor = AppColors.blue,
    this.spacing = 24,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          EyebrowText(
            number: number,
            text: title,
          ),
          if (showDivider) ...[
            SizedBox(height: spacing),
            AccentDivider(
              accentColor: accentColor,
            ),
          ],
        ],
      ),
    );
  }
}
