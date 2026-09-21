import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class NeonOutlineButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const NeonOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  State<NeonOutlineButton> createState() => _NeonOutlineButtonState();
}

class _NeonOutlineButtonState extends State<NeonOutlineButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = AppResponsive.scale(context).clamp(0.8, 1.2);
    final radius = 12.0 * s;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.025 : 1,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.all(
            (_isHovered ? 1.5 : 1.0) * s,
          ),
          decoration: BoxDecoration(
            gradient: AppGradients.primary,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF31D6FF).withValues(
                  alpha: _isHovered ? 0.16 : 0,
                ),
                blurRadius: 18 * s,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: AppColors.vibrantPink.withValues(
                  alpha: _isHovered ? 0.12 : 0,
                ),
                blurRadius: 18 * s,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(radius - 1),
            child: InkWell(
              onTap: widget.onPressed,
              borderRadius: BorderRadius.circular(radius - 1),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20 * s,
                  vertical: 12 * s,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        size: 17 * s,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.75),
                      ),
                      SizedBox(width: 9 * s),
                    ],
                    Text(
                      widget.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: AppTextStyles.buttonoutlined(context),
                    ),
                    SizedBox(width: 10 * s),
                    AnimatedSlide(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOutCubic,
                      offset: _isHovered ? const Offset(0.15, 0) : Offset.zero,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
