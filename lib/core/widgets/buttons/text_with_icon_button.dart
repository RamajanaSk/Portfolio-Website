import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';

class TextWithIconButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const TextWithIconButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<TextWithIconButton> createState() => _TextWithIconButtonState();
}

class _TextWithIconButtonState extends State<TextWithIconButton> {
  bool _isHovered = false;

  void _setHovered(bool value) {
    if (_isHovered == value) return;

    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: AnimatedScale(
        scale: _isHovered ? 1.025 : 1,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 11,
              ),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(
                  alpha: _isHovered ? 0.055 : 0,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.onSurface.withValues(
                    alpha: _isHovered ? 0.10 : 0,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(
                      alpha: _isHovered ? 0.12 : 0,
                    ),
                    blurRadius: 22,
                    spreadRadius: -4,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _AnimatedLabel(
                    text: widget.text.toUpperCase(),
                    isHovered: _isHovered,
                    color: colorScheme.onSurface,
                  ),
                  const SizedBox(width: 14),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOutCubic,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: _isHovered ? AppGradients.primary : null,
                      color: _isHovered
                          ? null
                          : colorScheme.primary.withValues(alpha: 0.10),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.primary.withValues(
                          alpha: _isHovered ? 0 : 0.35,
                        ),
                      ),
                    ),
                    child: AnimatedSlide(
                      offset: _isHovered ? const Offset(0.12, 0) : Offset.zero,
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOutCubic,
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 17,
                        color: _isHovered ? Colors.white : colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedLabel extends StatelessWidget {
  final String text;
  final bool isHovered;
  final Color color;

  const _AnimatedLabel({
    required this.text,
    required this.isHovered,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: isHovered ? 1.45 : 1.2,
            color: color,
          ),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 5),
        AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          width: isHovered ? 54 : 24,
          height: 2,
          decoration: BoxDecoration(
            gradient: AppGradients.primary,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ],
    );
  }
}
