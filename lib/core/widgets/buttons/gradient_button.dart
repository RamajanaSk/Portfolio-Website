import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppResponsive.scale(context).clamp(0.8, 1.2);

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF2D95),
            Color(0xFF8A2BE2),
          ],
        ),
        borderRadius: BorderRadius.circular(30 * s),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF2D95).withOpacity(0.4),
            blurRadius: 12 * s,
            spreadRadius: 1 * s,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(0, 42 * s),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(
            horizontal: 24 * s,
            vertical: 12 * s,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30 * s),
          ),
        ),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: AppTextStyles.buttonthick(context),
        ),
      ),
    );
  }
}
