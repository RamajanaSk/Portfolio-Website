import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlatformLink {
  final IconData icon;
  final String url;
  final String tooltip;

  const PlatformLink({
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  Map<String, dynamic> toMap() {
    return {
      "icon": _iconToString(icon),
      "url": url,
      "tooltip": tooltip,
    };
  }

  factory PlatformLink.fromMap(Map<String, dynamic> map) {
    return PlatformLink(
      icon: _iconFromString(map["icon"] as String),
      url: map["url"] as String,
      tooltip: map["tooltip"] as String,
    );
  }

  static String _iconToString(IconData icon) {
    if (icon == FontAwesomeIcons.github) return "github";
    if (icon == FontAwesomeIcons.linkedin) return "linkedin";
    if (icon == FontAwesomeIcons.googlePlay) return "googlePlay";
    if (icon == FontAwesomeIcons.globe) return "globe";
    if (icon == Icons.download) return "download";

    return "link";
  }

  static IconData _iconFromString(String iconName) {
    switch (iconName) {
      case "github":
        return FontAwesomeIcons.github;

      case "linkedin":
        return FontAwesomeIcons.linkedin;

      case "googlePlay":
        return FontAwesomeIcons.googlePlay;

      case "globe":
        return FontAwesomeIcons.globe;

      case "download":
        return Icons.download;

      default:
        return Icons.link;
    }
  }
}
