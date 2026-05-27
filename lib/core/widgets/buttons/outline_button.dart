import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';
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

    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.primary,
        borderRadius: BorderRadius.circular(30 * s),
      ),
      padding: EdgeInsets.all(1.5 * s),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30 * s),
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(0, 42 * s),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            padding: EdgeInsets.symmetric(
              horizontal: 24 * s,
              vertical: 12 * s,
            ),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30 * s),
            ),
            foregroundColor: Colors.white,
          ).copyWith(
            elevation: WidgetStateProperty.all(0),
          ),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: AppTextStyles.buttonthick(context),
          ),
        ),
      ),
    );
  }
}
