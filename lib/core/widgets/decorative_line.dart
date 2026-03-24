import 'package:flutter/material.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class DecorativeLine extends StatelessWidget {
  final Color leftColor;
  final Color rightColor;
  final double width;
  final double height;

  const DecorativeLine({
    super.key,
    required this.leftColor,
    required this.rightColor,
    this.width = 150,
    this.height = 15,
  });

  @override
  Widget build(BuildContext context) {
    final scale = AppResponsive.scale(context);

    final w = width * scale;
    final h = height * scale;

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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                rightColor,
                rightColor.withOpacity(0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ],
    );
  }
}
