import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/ProjectSection.dart' show ProjectSection;
import 'package:ramajana05/Data/Models/ProjectType.dart';
import 'package:ramajana05/Data/Models/SectionType.dart';

class Project {
  late final String id;
  late final ProjectType typ;
  late String name;
  late String shortDescription;
  late String longDescription;

  late String projectReason;
  late String hexcolor; // hex color, e.g. #FF5533

  // Media
  final String logoPicture;
  final String previewPicture;
  final List<String> mockupPicture;

  // Custom icons (tech used, e.g., Flutter, Unity)
  final List<String> platformIcons; // at least one icon

  // Sections
  late Map<SectionType, ProjectSection> sections;

  // flexible extra data
  final Map<String, dynamic>? extraInformation;

  Project({
    required this.id,
    required this.typ,
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.projectReason,
    required this.hexcolor,
    required this.logoPicture,
    required this.previewPicture,
    required this.mockupPicture,
    required this.sections,
    required this.platformIcons,
    this.extraInformation,
  }) : assert(platformIcons.isNotEmpty,
            "Project must have at least one platform icon");

  /// Update text of a specific section
  void updateSectionText(SectionType type, String newText) {
    sections[type]?.text = newText;
  }

  /// Update a platform icon at a given index
  void updatePlatformIcon(int index, String newIcon) {
    if (index >= 0 && index < platformIcons.length) {
      platformIcons[index] = newIcon;
    }
  }

  /// Change color theme
  void updateColor(String newHexColor) {
    hexcolor = newHexColor;
  }

  /// Convert to map for DB
  Map<String, dynamic> toMap() => {
        "id": id,
        "typ": typ.name,
        "name": name,
        "shortDescription": shortDescription,
        "longDescription": longDescription,
        "projectReason": projectReason,
        "hexcolor": hexcolor,
        "logoPicture": logoPicture,
        "previewPicture": previewPicture,
        "mockupPicture": mockupPicture,
        "sections": sections.map((k, v) => MapEntry(k.name, v.toMap())),
        "platformIcons": platformIcons,
      };

  /// Rebuild Project from DB
  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map["id"],
      typ: ProjectType.values.firstWhere((e) => e.name == map["typ"]),
      name: map["name"],
      shortDescription: map["shortDescription"],
      longDescription: map["longDescription"],
      projectReason: map["projectReason"],
      hexcolor: map["hexcolor"],
      logoPicture: map["logoPicture"],
      previewPicture: map["previewPicture"],
      mockupPicture: List<String>.from(map["mockupPicture"] ?? []),
      sections: (map["sections"] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          SectionType.values.firstWhere((e) => e.name == key),
          ProjectSection.fromMap(value),
        ),
      ),
      platformIcons: List<String>.from(map["platformIcons"] ?? []),
    );
  }
}
