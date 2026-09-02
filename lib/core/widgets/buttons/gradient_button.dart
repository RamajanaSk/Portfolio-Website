import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
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
          decoration: BoxDecoration(
            gradient: AppGradients.primary,
            borderRadius: BorderRadius.circular(radius),

            // Much cleaner than the large permanent glow
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF2D95).withValues(
                  alpha: _isHovered ? 0.32 : 0.16,
                ),
                blurRadius: _isHovered ? 22 * s : 14 * s,
                spreadRadius: _isHovered ? 1 * s : 0,
                offset: Offset(0, 5 * s),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.14),
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(radius),
              child: InkWell(
                onTap: widget.onPressed,
                borderRadius: BorderRadius.circular(radius),
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
                          color: Colors.white,
                        ),
                        SizedBox(width: 9 * s),
                      ],
                      Text(
                        widget.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: AppTextStyles.buttonthick(context),
                      ),
                      SizedBox(width: 10 * s),
                      AnimatedSlide(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOutCubic,
                        offset:
                            _isHovered ? const Offset(0.15, 0) : Offset.zero,
                        child: Icon(
                          Icons.arrow_outward_rounded,
                          size: 16 * s,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
