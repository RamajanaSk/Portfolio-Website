import 'package:flutter/material.dart';

class NormalSectionDivider extends StatelessWidget {
  final double height;

  const NormalSectionDivider({
    super.key,
    this.height = 5,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).dividerColor;

    return Container(
      height: height,
      width: double.infinity,
      color: color.withOpacity(0.2),
    );
  }
}
