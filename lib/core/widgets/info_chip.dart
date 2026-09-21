import 'package:flutter/material.dart';

class InfoChip extends StatefulWidget {
  final String text;
  final IconData? icon;

  const InfoChip({
    super.key,
    required this.text,
    this.icon,
  });

  @override
  State<InfoChip> createState() => _InfoChipState();
}

class _InfoChipState extends State<InfoChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.035 : 1,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: colorScheme.onSurface.withValues(
              alpha: _isHovered ? 0.075 : 0.035,
            ),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFF31D6FF).withValues(alpha: 0.45)
                  : colorScheme.onSurface.withValues(alpha: 0.10),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF31D6FF).withValues(
                  alpha: _isHovered ? 0.13 : 0,
                ),
                blurRadius: 18,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFFFF2D95).withValues(
                  alpha: _isHovered ? 0.09 : 0,
                ),
                blurRadius: 18,
                spreadRadius: -5,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        Color(0xFF31D6FF),
                        Color(0xFFFF2D95),
                      ],
                    ).createShader(bounds);
                  },
                  child: Icon(
                    widget.icon,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
              ] else ...[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: _isHovered ? 7 : 6,
                  height: _isHovered ? 7 : 6,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF31D6FF),
                        Color(0xFFFF2D95),
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF31D6FF).withValues(
                          alpha: _isHovered ? 0.6 : 0.25,
                        ),
                        blurRadius: _isHovered ? 8 : 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 9),
              ],
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutCubic,
                style: TextStyle(
                  fontSize: 13,
                  height: 1.1,
                  fontWeight: FontWeight.w600,
                  letterSpacing: _isHovered ? 0.65 : 0.45,
                  color: colorScheme.onSurface.withValues(
                    alpha: _isHovered ? 0.95 : 0.72,
                  ),
                ),
                child: Text(
                  widget.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
