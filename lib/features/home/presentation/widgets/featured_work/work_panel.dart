import 'package:flutter/material.dart';

class WorkPanel extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final Widget child;
  final double? minHeight;

  const WorkPanel({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.child,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final foreground = theme.colorScheme.onSurface;

    final effectiveAccent =
        dark ? accent : Color.lerp(accent, Colors.black, 0.3)!;

    return Container(
      constraints: BoxConstraints(
        minHeight: minHeight ?? 0,
      ),
      decoration: BoxDecoration(
        color: dark
            ? const Color(0xFF111114)
            : Color.alphaBlend(
                accent.withValues(alpha: 0.025),
                theme.colorScheme.surface,
              ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: foreground.withValues(alpha: 0.10),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(
            foreground: foreground,
            effectiveAccent: effectiveAccent,
          ),
          Divider(
            height: 1,
            color: foreground.withValues(alpha: 0.08),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader({
    required Color foreground,
    required Color effectiveAccent,
  }) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$number / ',
                        style: TextStyle(
                          color: effectiveAccent,
                        ),
                      ),
                      TextSpan(text: title),
                    ],
                  ),
                  softWrap: true,
                  style: TextStyle(
                    color: foreground,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ExcludeSemantics(
                child: Icon(
                  icon,
                  size: 21,
                  color: effectiveAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            softWrap: true,
            style: TextStyle(
              color: foreground.withValues(alpha: 0.55),
              fontSize: 12,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
