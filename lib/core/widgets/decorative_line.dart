import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class DecorativeLine extends StatelessWidget {
  final Color leftColor;
  final double width;
  final double height;

  const DecorativeLine({
    super.key,
    required this.leftColor,
    this.width = 120,
    this.height = 10,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppResponsive.scale(context).clamp(0.85, 1.2);

    final w = width * s;
    final h = height * s;

    return Row(
      children: [
        Container(
          width: w,
          height: h,
          color: leftColor,
        ),
        Container(
          width: w,
          height: h,
          decoration: const BoxDecoration(
            gradient: AppGradients.primary,
          ),
        ),
      ],
    );
  }
}
