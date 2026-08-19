import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final bool showBottomSpacing;

  const StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    this.showBottomSpacing = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: showBottomSpacing ? 24 : 0,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
            color: color,
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF656275),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
