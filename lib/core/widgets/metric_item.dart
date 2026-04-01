import 'package:flutter/material.dart';

class MetricItem extends StatefulWidget {
  final String value;
  final String label;

  const MetricItem({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  State<MetricItem> createState() => _MetricItemState();
}

class _MetricItemState extends State<MetricItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔥 VALUE
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFFFF2D95),
                  Color(0xFF8A2BE2),
                  Color(0xFF00CFFF),
                ],
              ).createShader(bounds),
              child: Text(
                widget.value,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 6),

            // 🔹 LABEL
            Text(
              widget.label.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 1.2,
                color: color.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
