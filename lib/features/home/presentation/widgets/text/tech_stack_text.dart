import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/colored_dot.dart';

class TechStackText extends StatelessWidget {
  const TechStackText({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.techStackHeader(context);

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('FLUTTER', style: style),
          const ColoredDot(
            color: AppColors.blue,
          ),
          Text('DART', style: style),
          const ColoredDot(
            color: AppColors.pink,
          ),
          Text('UI/UX', style: style),
        ],
      ),
    );
  }
}
