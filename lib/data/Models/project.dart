import 'package:ramajana05/Data/Models/ProjectSection.dart' show ProjectSection;
import 'package:ramajana05/Data/Models/ProjectType.dart';
import 'package:ramajana05/Data/Models/SectionType.dart';
import 'package:ramajana05/core/utils/platform_link.dart';

class Project {
  final String id;
  final ProjectType typ;

  // Basic
  String name;
  String catchPhrase;
  String shortDescription;
  String longDescription;
  String projectReason;

  // Meta
  final DateTime startDate;
  final DateTime endDate;
  final int durationInMonths;

  final bool isSolo;
  final String role; // z.B. "Fullstack Developer", "VR Developer"

  final String? grade; // z.B. "1.3"
  final String? universityContext; // z.B. "Bachelor Project"

  // Tech
  final List<PlatformLink> platformLinks;
  final List<String> technologies; // z.B. ["Flutter", "Dart", "REST"]

  // Links
  final String githubUrl;
  final String? liveDemoUrl;
  final String? apkUrl;

  // Media
  final String logoPicture;
  final String previewPicture;
  final String aboutPicture;
  final List<String> mockupPicture;
  final List<String> gallery;

  // Design
  String hexcolor;

  // Content Sections
  Map<SectionType, ProjectSection> sections;

  // Highlights
  final List<String> keyFeatures;
  final List<String> challenges;
  final List<String> learnings;

  Project({
    required this.id,
    required this.typ,
    required this.name,
    required this.catchPhrase,
    required this.shortDescription,
    required this.longDescription,
    required this.projectReason,
    required this.startDate,
    required this.endDate,
    required this.durationInMonths,
    required this.isSolo,
    required this.role,
    this.grade,
    this.universityContext,
    required this.platformLinks,
    required this.technologies,
    required this.githubUrl,
    this.liveDemoUrl,
    this.apkUrl,
    required this.logoPicture,
    required this.aboutPicture,
    required this.previewPicture,
    required this.mockupPicture,
    required this.gallery,
    required this.hexcolor,
    required this.sections,
    required this.keyFeatures,
    required this.challenges,
    required this.learnings,
  });

  /// Update text of a specific section
  void updateSectionText(SectionType type, String newText) {
    sections[type]?.text = newText;
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
        "catchPhrase": catchPhrase,
        "longDescription": longDescription,
        "projectReason": projectReason,
        "hexcolor": hexcolor,
        "githuburl": githubUrl,
        "logoPicture": logoPicture,
        "aboutPicture": aboutPicture,
        "previewPicture": previewPicture,
        "mockupPicture": mockupPicture,
        "sections": sections.map((k, v) => MapEntry(k.name, v.toMap())),
        "platformLinks": platformLinks.map((e) => e.toMap()).toList(),
      };

  /// Rebuild Project from DB
  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map["id"],
      typ: ProjectType.values.firstWhere((e) => e.name == map["typ"]),
      name: map["name"],
      shortDescription: map["shortDescription"],
      catchPhrase: map["catchPhrase"],
      longDescription: map["longDescription"],
      projectReason: map["projectReason"],
      startDate: DateTime.parse(map["startDate"]),
      endDate: DateTime.parse(map["endDate"]),
      durationInMonths: map["durationInMonths"],
      isSolo: map["isSolo"],
      role: map["role"],
      grade: map["grade"],
      universityContext: map["universityContext"],
      technologies: List<String>.from(map["technologies"] ?? []),
      githubUrl: map["githubUrl"],
      liveDemoUrl: map["liveDemoUrl"],
      apkUrl: map["apkUrl"],
      hexcolor: map["hexcolor"],
      logoPicture: map["logoPicture"],
      aboutPicture: map["aboutPicture"],
      previewPicture: map["previewPicture"],
      mockupPicture: List<String>.from(map["mockupPicture"] ?? []),
      gallery: List<String>.from(map["gallery"] ?? []),
      sections: (map["sections"] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          SectionType.values.firstWhere((e) => e.name == key),
          ProjectSection.fromMap(value),
        ),
      ),
      platformLinks: (map["platformLinks"] as List<dynamic>? ?? [])
          .map((e) => PlatformLink.fromMap(e))
          .toList(),
      keyFeatures: List<String>.from(map["keyFeatures"] ?? []),
      challenges: List<String>.from(map["challenges"] ?? []),
      learnings: List<String>.from(map["learnings"] ?? []),
    );
  }
}
