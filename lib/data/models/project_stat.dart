import 'package:flutter/material.dart';

class ProjectStat {
  final IconData icon;
  final String value;
  final String label;

  const ProjectStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  // ============================================================
  // TO MAP
  // ============================================================

  Map<String, dynamic> toMap() {
    return {
      'icon': {
        'codePoint': icon.codePoint,
        'fontFamily': icon.fontFamily,
        'fontPackage': icon.fontPackage,
        'matchTextDirection': icon.matchTextDirection,
      },
      'value': value,
      'label': label,
    };
  }

  // ============================================================
  // FROM MAP
  // ============================================================

  factory ProjectStat.fromMap(Map<String, dynamic> map) {
    final iconMap = Map<String, dynamic>.from(
      map['icon'] ?? {},
    );

    return ProjectStat(
      icon: IconData(
        iconMap['codePoint'] ?? Icons.info_outline.codePoint,
        fontFamily: iconMap['fontFamily'] ?? Icons.info_outline.fontFamily,
        fontPackage: iconMap['fontPackage'] ?? Icons.info_outline.fontPackage,
        matchTextDirection: iconMap['matchTextDirection'] ?? false,
      ),
      value: map['value'] ?? '',
      label: map['label'] ?? '',
    );
  }
}
