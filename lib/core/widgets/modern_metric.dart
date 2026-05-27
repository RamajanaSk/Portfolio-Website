import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';

class ModernMetric extends StatefulWidget {
  final String value;
  final String title;
  final String subtitle;

  const ModernMetric({
    super.key,
    required this.value,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ModernMetric> createState() => _ModernMetricState();
}

class _ModernMetricState extends State<ModernMetric> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.identity()..translate(0.0, hovered ? -4 : 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: hovered ? 1.04 : 1.0,
              duration: const Duration(milliseconds: 220),
              child: ShaderMask(
                shaderCallback: (bounds) =>
                    AppGradients.primary.createShader(bounds),
                child: Text(
                  widget.value,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.metricValue(context),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.metricTitle(context),
            ),
          ],
        ),
      ),
    );
  }
}
