import 'package:ramajana05/core/utils/platform_link.dart';
import 'package:ramajana05/data/models/project_feature.dart';
import 'package:ramajana05/data/models/project_section.dart';
import 'package:ramajana05/data/models/project_stat.dart';
import 'package:ramajana05/data/models/project_type.dart';
import 'package:ramajana05/data/models/section_type.dart';

class Project {
  final String id;
  final ProjectType typ;

  String name;
  String catchPhrase;
  String shortDescription;
  String longDescription;
  String projectReason;

  final DateTime startDate;
  final DateTime endDate;
  final int durationInMonths;

  final bool isSolo;
  final String role;

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
  final String bannerPreviewPicture;
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

  final String heroBackground;
  final String phoneMockup;
  final String subtitle;
  final String githubUrl1;
  final String demoUrl;
  final String playStoreUrl;

  final String problemTitle;
  final String problem;
  final String problemImage;

  final String solutionTitle;
  final String solution;
  final String solutionImage;

  final List<ProjectStat> stats;
  final List<ProjectFeature> features;

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
    required this.bannerPreviewPicture,
    required this.mockupPicture,
    required this.gallery,
    required this.hexcolor,
    required this.sections,
    required this.keyFeatures,
    required this.challenges,
    required this.learnings,
    required this.heroBackground,
    required this.phoneMockup,
    required this.subtitle,
    required this.githubUrl1,
    required this.demoUrl,
    required this.playStoreUrl,
    required this.problemTitle,
    required this.problem,
    required this.problemImage,
    required this.solutionTitle,
    required this.solution,
    required this.solutionImage,
    required this.stats,
    required this.features,
  });

  /// Update text of a specific section
  void updateSectionText(SectionType type, String newText) {
    sections[type]?.text = newText;
  }

  /// Change color theme
  void updateColor(String newHexColor) {
    hexcolor = newHexColor;
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "typ": typ.name,

        // Text
        "name": name,
        "shortDescription": shortDescription,
        "catchPhrase": catchPhrase,
        "longDescription": longDescription,
        "projectReason": projectReason,

        // Project info
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "durationInMonths": durationInMonths,
        "isSolo": isSolo,
        "role": role,
        "grade": grade,
        "universityContext": universityContext,

        // Tech
        "technologies": technologies,
        "platformLinks": platformLinks.map((e) => e.toMap()).toList(),

        // Links
        "githubUrl": githubUrl,
        "liveDemoUrl": liveDemoUrl,
        "apkUrl": apkUrl,

        // Media
        "logoPicture": logoPicture,
        "aboutPicture": aboutPicture,
        "previewPicture": previewPicture,
        "bannerPreviewPicture": bannerPreviewPicture,
        "mockupPicture": mockupPicture,
        "gallery": gallery,

        // Design
        "hexcolor": hexcolor,

        // Sections
        "sections": sections.map(
          (key, value) => MapEntry(key.name, value.toMap()),
        ),

        // Highlights
        "keyFeatures": keyFeatures,
        "challenges": challenges,
        "learnings": learnings,

        // Hero
        "heroBackground": heroBackground,
        "phoneMockup": phoneMockup,
        "subtitle": subtitle,
        "githubUrl1": githubUrl1,
        "demoUrl": demoUrl,
        "playStoreUrl": playStoreUrl,

        // Problem
        "problemTitle": problemTitle,
        "problem": problem,
        "problemImage": problemImage,

        // Solution
        "solutionTitle": solutionTitle,
        "solution": solution,
        "solutionImage": solutionImage,

        // Stats / Features
        "stats": stats,
        "features": features,
      };

  /// Rebuild Project from DB
  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map["id"],
      typ: ProjectType.values.firstWhere(
        (e) => e.name == map["typ"],
      ),

      // Text
      name: map["name"],
      shortDescription: map["shortDescription"],
      catchPhrase: map["catchPhrase"],
      longDescription: map["longDescription"],
      projectReason: map["projectReason"],

      // Project info
      startDate: DateTime.parse(map["startDate"]),
      endDate: DateTime.parse(map["endDate"]),
      durationInMonths: map["durationInMonths"],
      isSolo: map["isSolo"],
      role: map["role"],
      grade: map["grade"],
      universityContext: map["universityContext"],

      // Tech
      technologies: List<String>.from(
        map["technologies"] ?? [],
      ),
      platformLinks: (map["platformLinks"] as List<dynamic>? ?? [])
          .map(
            (e) => PlatformLink.fromMap(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList(),

      // Links
      githubUrl: map["githubUrl"],
      liveDemoUrl: map["liveDemoUrl"],
      apkUrl: map["apkUrl"],

      // Media
      logoPicture: map["logoPicture"],
      aboutPicture: map["aboutPicture"],
      previewPicture: map["previewPicture"],
      bannerPreviewPicture: map["bannerPreviewPicture"],
      mockupPicture: List<String>.from(
        map["mockupPicture"] ?? [],
      ),
      gallery: List<String>.from(
        map["gallery"] ?? [],
      ),

      // Design
      hexcolor: map["hexcolor"],

      // Sections
      sections: (map["sections"] as Map<String, dynamic>? ?? {}).map(
        (key, value) => MapEntry(
          SectionType.values.firstWhere(
            (e) => e.name == key,
          ),
          ProjectSection.fromMap(
            Map<String, dynamic>.from(value),
          ),
        ),
      ),

      // Highlights
      keyFeatures: List<String>.from(
        map["keyFeatures"] ?? [],
      ),
      challenges: List<String>.from(
        map["challenges"] ?? [],
      ),
      learnings: List<String>.from(
        map["learnings"] ?? [],
      ),

      // Hero
      heroBackground: map["heroBackground"] ?? '',
      phoneMockup: map["phoneMockup"] ?? '',
      subtitle: map["subtitle"] ?? '',
      githubUrl1: map["githubUrl1"] ?? '',
      demoUrl: map["demoUrl"] ?? '',
      playStoreUrl: map["playStoreUrl"] ?? '',

      // Problem
      problemTitle: map["problemTitle"] ?? '',
      problem: map["problem"] ?? '',
      problemImage: map["problemImage"] ?? '',

      // Solution
      solutionTitle: map["solutionTitle"] ?? '',
      solution: map["solution"] ?? '',
      solutionImage: map["solutionImage"] ?? '',

      // Stats
      stats: List<ProjectStat>.from(map["stats"] ?? []),
      features: List<ProjectFeature>.from(map["features"] ?? []),
    );
  }
}
