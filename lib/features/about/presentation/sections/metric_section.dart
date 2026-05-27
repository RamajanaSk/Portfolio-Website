import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/modern_metric.dart';

class MetricsSection extends StatelessWidget {
  const MetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 90,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1700,
          ),
          child: const Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 200,
            runSpacing: 100,
            children: [
              ModernMetric(
                value: "FLUTTER",
                title: "Mobile Specialization",
                subtitle: "Responsive cross-platform apps",
              ),
              ModernMetric(
                value: "10+",
                title: "Applications Built",
                subtitle: "Built with modern technologies",
              ),
              ModernMetric(
                value: "MAPS & VR",
                title: "Creative Systems",
                subtitle: "Interactive 3D & GPS experiences",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
