import 'package:flutter/material.dart';

import 'package:ramajana05/core/theme/app_text_styles.dart';

class TopBarButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const TopBarButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      child: Text(text, style: AppTextStyles.topBarTextButton(context)),
    );
  }
}
