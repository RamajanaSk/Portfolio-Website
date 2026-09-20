import 'package:flutter/material.dart';

class ProjectButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color accent;
  final bool filled;
  final VoidCallback onPressed;

  const ProjectButton({
    super.key,
    required this.text,
    required this.icon,
    required this.accent,
    required this.filled,
    required this.onPressed,
  });

  @override
  State<ProjectButton> createState() => _ProjectCtaButtonState();
}

class _ProjectCtaButtonState extends State<ProjectButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final foregroundColor = widget.filled ? Colors.black : colors.onSurface;

    final backgroundColor = widget.filled
        ? widget.accent
        : _isHovered
            ? colors.onSurface.withValues(alpha: .07)
            : Colors.transparent;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: AnimatedScale(
        scale: _isHovered ? 1.025 : 1,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: _buildBorder(colors),
                boxShadow: _buildShadow(),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.icon,
                    size: 17,
                    color: foregroundColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.text,
                    style: TextStyle(
                      color: foregroundColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .7,
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

  void _setHovered(bool value) {
    if (_isHovered == value) return;

    setState(() {
      _isHovered = value;
    });
  }

  Border? _buildBorder(ColorScheme colors) {
    if (widget.filled) return null;

    return Border.all(
      color: colors.onSurface.withValues(
        alpha: _isHovered ? .35 : .16,
      ),
    );
  }

  List<BoxShadow>? _buildShadow() {
    if (!widget.filled) return null;

    return [
      BoxShadow(
        color: widget.accent.withValues(
          alpha: _isHovered ? .30 : .14,
        ),
        blurRadius: _isHovered ? 26 : 16,
        offset: const Offset(0, 7),
      ),
    ];
  }
}
