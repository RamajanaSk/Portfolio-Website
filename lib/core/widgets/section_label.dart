import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';

class SectionLabel extends StatelessWidget {
  final String text;
  final Color color;

  const SectionLabel({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.sectionLabel(
        context,
        color: color,
      ),
    );
  }
}
