import 'package:flutter/material.dart';

import 'package:ramajana05/core/theme/app_text_styles.dart';

class TopBarMobileButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;

  const TopBarMobileButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onPressed?.call();
        },
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 16,
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 18,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 14),
              ],
              Expanded(
                child: Text(
                  text,
                  style: AppTextStyles.topBarTextButton(context).copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: .8,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 17,
                color: colorScheme.onSurface.withValues(
                  alpha: .25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
