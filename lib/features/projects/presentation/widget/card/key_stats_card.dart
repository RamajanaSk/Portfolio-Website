import 'package:flutter/material.dart';
import 'package:ramajana05/core/utils/color_utils.dart';
import 'package:ramajana05/data/models/Project.dart';
import 'package:ramajana05/features/projects/presentation/widget/item/stat_item.dart';

class KeyStatsCard extends StatelessWidget {
  final Project project;

  const KeyStatsCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final stats = project.stats;
    final projectColor = ColorUtils.fromHex(project.hexcolor);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 28,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Key Stats',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),
          for (int i = 0; i < stats.length; i++)
            StatItem(
              icon: stats[i].icon,
              value: stats[i].value,
              label: stats[i].label,
              color: projectColor,
              showBottomSpacing: i != stats.length - 1,
            ),
        ],
      ),
    );
  }
}
