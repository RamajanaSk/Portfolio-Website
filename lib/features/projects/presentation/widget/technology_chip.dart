import 'package:flutter/material.dart';

class TechnologyChip extends StatelessWidget {
  final String technology;

  const TechnologyChip({
    required this.technology,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _iconForTechnology(technology),
            size: 18,
            color: Colors.white70,
          ),
          const SizedBox(width: 8),
          Text(
            technology,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForTechnology(String tech) {
    switch (tech.toLowerCase()) {
      case "flutter":
        return Icons.flutter_dash;

      case "dart":
        return Icons.code;

      case "sqlite":
        return Icons.storage;

      case "firebase":
        return Icons.local_fire_department;

      case "rest api":
        return Icons.api;

      case "openstreetmap":
        return Icons.map;

      case "android":
        return Icons.android;

      case "ios":
        return Icons.phone_iphone;

      case "material 3":
        return Icons.palette;

      case "provider":
        return Icons.account_tree;

      case "bloc":
        return Icons.hub;

      case "git":
        return Icons.commit;

      default:
        return Icons.code;
    }
  }
}
