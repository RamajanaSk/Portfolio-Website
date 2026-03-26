import 'package:flutter/material.dart';

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
      "icon": icon.codePoint, // store as int
      "url": url,
      "tooltip": tooltip,
    };
  }

  factory PlatformLink.fromMap(Map<String, dynamic> map) {
    return PlatformLink(
      icon: IconData(
        map["icon"],
        fontFamily: 'FontAwesomeSolid', // ⚠️ important
      ),
      url: map["url"],
      tooltip: map["tooltip"],
    );
  }
}
