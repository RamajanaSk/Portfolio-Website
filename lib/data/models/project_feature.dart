import 'package:flutter/material.dart';

class ProjectFeature {
  final IconData icon;
  final String title;
  final String description;
  final String? image;

  const ProjectFeature({
    required this.icon,
    required this.title,
    required this.description,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'icon': {
        'codePoint': icon.codePoint,
        'fontFamily': icon.fontFamily,
        'fontPackage': icon.fontPackage,
        'matchTextDirection': icon.matchTextDirection,
      },
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory ProjectFeature.fromMap(Map<String, dynamic> map) {
    final iconMap = Map<String, dynamic>.from(
      map['icon'] ?? {},
    );

    return ProjectFeature(
      icon: IconData(
        iconMap['codePoint'] ?? Icons.star_outline_rounded.codePoint,
        fontFamily:
            iconMap['fontFamily'] ?? Icons.star_outline_rounded.fontFamily,
        fontPackage:
            iconMap['fontPackage'] ?? Icons.star_outline_rounded.fontPackage,
        matchTextDirection: iconMap['matchTextDirection'] ?? false,
      ),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'],
    );
  }
}
