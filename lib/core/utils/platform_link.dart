
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlatformLink {
  final Object icon;
  final String url;
  final String tooltip;

  const PlatformLink({
    required this.icon,
    required this.url,
    required this.tooltip,
  }) : assert(icon is IconData || icon is FaIconData);

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

  static String _iconToString(Object icon) {
    if (icon == FontAwesomeIcons.github) return "github";
    if (icon == FontAwesomeIcons.linkedin) return "linkedin";
    if (icon == FontAwesomeIcons.googlePlay) return "googlePlay";
    if (icon == FontAwesomeIcons.globe) return "globe";
    if (icon == FontAwesomeIcons.flutter) return "flutter";
    if (icon == FontAwesomeIcons.android) return "android";
    if (icon == Icons.download) return "download";
    if (icon == Icons.link) return "link";

    return "link";
  }

  static Object _iconFromString(String iconName) {
    switch (iconName) {
      case "github":
        return FontAwesomeIcons.github;

      case "linkedin":
        return FontAwesomeIcons.linkedin;

      case "googlePlay":
        return FontAwesomeIcons.googlePlay;

      case "globe":
        return FontAwesomeIcons.globe;

      case "flutter":
        return FontAwesomeIcons.flutter;

      case "android":
        return FontAwesomeIcons.android;

      case "download":
        return Icons.download;

      case "link":
      default:
        return Icons.link;
    }
  }

  // Unterstützt FontAwesome- und Material-Icons
  static Widget buildIcon(
    Object icon, {
    double size = 24,
    Color? color,
  }) {
    if (icon is FaIconData) {
      return FaIcon(
        icon,
        size: size,
        color: color,
      );
    }

    if (icon is IconData) {
      return Icon(
        icon,
        size: size,
        color: color,
      );
    }

    return Icon(
      Icons.link,
      size: size,
      color: color,
    );
  }
}
