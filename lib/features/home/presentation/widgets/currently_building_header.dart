import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/widgets/divider/accent_divider.dart';
import 'package:ramajana05/core/widgets/text/eyebrow_text.dart';

class CurrentlyBuildingHeader extends StatelessWidget {
  const CurrentlyBuildingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EyebrowText(
            number: '02',
            text: 'CURRENTLY BUILDING',
          ),
          SizedBox(height: 24),
          AccentDivider(accentColor: AppColors.blue),
        ],
      ),
    );
  }
}
