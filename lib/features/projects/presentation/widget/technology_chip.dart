import 'package:flutter/material.dart';

class TechnologyChip extends StatelessWidget {
  final String technology;

  const TechnologyChip({
    super.key,
    required this.technology,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.35,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _iconForTechnology(technology),
            size: 18,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            technology,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.88),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForTechnology(String technology) {
    switch (technology.toLowerCase().trim()) {
      case 'flutter':
        return Icons.flutter_dash_rounded;

      case 'dart':
        return Icons.code_rounded;

      case 'sqlite':
        return Icons.storage_rounded;

      case 'firebase':
        return Icons.local_fire_department_rounded;

      case 'rest api':
        return Icons.api_rounded;

      case 'openstreetmap':
        return Icons.map_rounded;

      case 'android':
        return Icons.android_rounded;

      case 'ios':
        return Icons.phone_iphone_rounded;

      case 'material 3':
        return Icons.palette_rounded;

      case 'provider':
        return Icons.account_tree_rounded;

      case 'bloc':
        return Icons.hub_rounded;

      case 'git':
        return Icons.commit_rounded;

      default:
        return Icons.code_rounded;
    }
  }
}
