import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';

class TopBarMobileButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const TopBarMobileButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
          onPressed?.call();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text(
            text,
            style: AppTextStyles.topBarTextButton(context),
          ),
        ),
      ),
    );
  }
}
