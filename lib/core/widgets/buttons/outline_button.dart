import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class NeonOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const NeonOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppResponsive.scale(context).clamp(0.8, 1.2);

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(0, 42 * s),
        padding: EdgeInsets.symmetric(
          horizontal: 24 * s,
          vertical: 12 * s,
        ),
        side: BorderSide(
          color: const Color(0xFF8A2BE2),
          width: 1.5 * s,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30 * s),
        ),
        foregroundColor: const Color(0xFF8A2BE2),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: AppTextStyles.buttonthick(context),
      ),
    );
  }
}
