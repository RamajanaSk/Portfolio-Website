import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
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
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 200,
            runSpacing: 100,
            children: [
              ModernMetric(
                value: "FLUTTER",
                title: context.l10n.mobileSpecialization,
                subtitle: "",
              ),
              ModernMetric(
                value: "10+",
                title: context.l10n.applicationsBuilt,
                subtitle: "",
              ),
              ModernMetric(
                value: "MAPS & VR",
                title: context.l10n.creativeSystems,
                subtitle: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
