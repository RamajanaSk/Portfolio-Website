import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';

class SectionHeaderText extends StatelessWidget {
  final String text;

  const SectionHeaderText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: AppTextStyles.sectionHeader(context),
    );
  }
}
