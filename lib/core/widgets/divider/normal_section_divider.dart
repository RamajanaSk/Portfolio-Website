import 'package:flutter/material.dart';

class NormalSectionDivider extends StatelessWidget {
  final double height;
  final Color? color;

  const NormalSectionDivider({
    super.key,
    this.height = 8,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? Theme.of(context).dividerColor;

    return Container(
      height: height,
      width: double.infinity,
      color: dividerColor,
    );
  }
}
