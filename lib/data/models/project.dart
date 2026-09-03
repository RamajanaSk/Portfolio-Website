import 'package:ramajana05/core/utils/platform_link.dart';
import 'package:ramajana05/data/models/project_feature.dart';
import 'package:ramajana05/data/models/project_section.dart';
import 'package:ramajana05/data/models/project_stat.dart';
import 'package:ramajana05/data/models/project_type.dart';
import 'package:ramajana05/data/models/section_type.dart';

class Project {
  // ============================================================
  // BASIC
  // ============================================================

  final String id;
  final ProjectType typ;

  String name;
  String catchPhrase;
  String shortDescription;
  String longDescription;
  String projectReason;

  // ============================================================
  // PROJECT INFO
  // ============================================================

  final DateTime startDate;
  final DateTime endDate;
  final int durationInMonths;

  final bool isSolo;
  final String role;

  final String? grade;
  final String? universityContext;

  // ============================================================
  // RELEASE INFO
  // ============================================================

  /// Official release date of the project/app.
  /// Null if the project has not been released.
  final DateTime? releaseDate;

  /// Current/public version, e.g. "1.0.0".
  final String? version;

  /// Platform label, e.g. "Android", "Web", "Android & iOS".
  final String? platform;

  /// Whether the project is currently publicly released.
  final bool isPublished;

  // ============================================================
  // TECH
  // ============================================================

  final List<PlatformLink> platformLinks;
  final List<String> technologies;

  // ============================================================
  // LINKS
  // ============================================================

  final String githubUrl;
  final String? liveDemoUrl;
  final String? apkUrl;
  final String? playStoreUrl;

  // ============================================================
  // MEDIA
  // ============================================================

  final String logoPicture;
  final String previewPicture;
  final String bannerPreviewPicture;
  final String aboutPicture;

  final List<String> mockupPicture;
  final List<String> gallery;

  // ============================================================
  // DESIGN
  // ============================================================

  String hexcolor;

  // ============================================================
  // CONTENT SECTIONS
  // ============================================================

  Map<SectionType, ProjectSection> sections;

  // ============================================================
  // HIGHLIGHTS
  // ============================================================

  final List<String> keyFeatures;
  final List<String> challenges;
  final List<String> learnings;

  // ============================================================
  // HERO
  // ============================================================

  final String heroBackground;
  final String phoneMockup;
  final String subtitle;

  // ============================================================
  // PROBLEM
  // ============================================================

  final String problemTitle;
  final String problem;
  final String problemImage;

  // ============================================================
  // SOLUTION
  // ============================================================

  final String solutionTitle;
  final String solution;
  final String solutionImage;

  // ============================================================
  // STATS / FEATURES
  // ============================================================

  final List<ProjectStat> stats;
  final List<ProjectFeature> features;

  // ============================================================
  // CONSTRUCTOR
  // ============================================================

  Project({
    required this.id,
    required this.typ,

    // Text
    required this.name,
    required this.catchPhrase,
    required this.shortDescription,
    required this.longDescription,
    required this.projectReason,

    // Project info
    required this.startDate,
    required this.endDate,
    required this.durationInMonths,
    required this.isSolo,
    required this.role,
    this.grade,
    this.universityContext,

    // Release
    this.releaseDate,
    this.version,
    this.platform,
    this.isPublished = false,

    // Tech
    required this.platformLinks,
    required this.technologies,

    // Links
    required this.githubUrl,
    this.liveDemoUrl,
    this.apkUrl,
    this.playStoreUrl,

    // Media
    required this.logoPicture,
    required this.aboutPicture,
    required this.previewPicture,
    required this.bannerPreviewPicture,
    required this.mockupPicture,
    required this.gallery,

    // Design
    required this.hexcolor,

    // Sections
    required this.sections,

    // Highlights
    required this.keyFeatures,
    required this.challenges,
    required this.learnings,

    // Hero
    required this.heroBackground,
    required this.phoneMockup,
    required this.subtitle,

    // Problem
    required this.problemTitle,
    required this.problem,
    required this.problemImage,

    // Solution
    required this.solutionTitle,
    required this.solution,
    required this.solutionImage,

    // Stats / Features
    required this.stats,
    required this.features,
  });

  // ============================================================
  // HELPERS
  // ============================================================

  /// Returns true if this project has a Google Play Store page.
  bool get hasPlayStore =>
      playStoreUrl != null && playStoreUrl!.trim().isNotEmpty;

  /// Returns true if a live demo exists.
  bool get hasLiveDemo => liveDemoUrl != null && liveDemoUrl!.trim().isNotEmpty;

  /// Returns true if a GitHub repository exists.
  bool get hasGithub => githubUrl.trim().isNotEmpty;

  /// Returns true if an APK exists.
  bool get hasApk => apkUrl != null && apkUrl!.trim().isNotEmpty;

  /// Example:
  /// September 2026
  String? get formattedReleaseDate {
    if (releaseDate == null) return null;

    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${months[releaseDate!.month - 1]} ${releaseDate!.year}';
  }

  /// Short version for UI:
  /// SEP 2026
  String? get shortReleaseDate {
    if (releaseDate == null) return null;

    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];

    return '${months[releaseDate!.month - 1]} ${releaseDate!.year}';
  }

  /// Update text of a specific section.
  void updateSectionText(
    SectionType type,
    String newText,
  ) {
    sections[type]?.text = newText;
  }

  /// Change project theme color.
  void updateColor(String newHexColor) {
    hexcolor = newHexColor;
  }

  // ============================================================
  // TO MAP
  // ============================================================

  Map<String, dynamic> toMap() => {
        // Basic
        'id': id,
        'typ': typ.name,

        // Text
        'name': name,
        'shortDescription': shortDescription,
        'catchPhrase': catchPhrase,
        'longDescription': longDescription,
        'projectReason': projectReason,

        // Project info
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'durationInMonths': durationInMonths,
        'isSolo': isSolo,
        'role': role,
        'grade': grade,
        'universityContext': universityContext,

        // Release
        'releaseDate': releaseDate?.toIso8601String(),
        'version': version,
        'platform': platform,
        'isPublished': isPublished,

        // Tech
        'technologies': technologies,
        'platformLinks': platformLinks
            .map(
              (e) => e.toMap(),
            )
            .toList(),

        // Links
        'githubUrl': githubUrl,
        'liveDemoUrl': liveDemoUrl,
        'apkUrl': apkUrl,
        'playStoreUrl': playStoreUrl,

        // Media
        'logoPicture': logoPicture,
        'aboutPicture': aboutPicture,
        'previewPicture': previewPicture,
        'bannerPreviewPicture': bannerPreviewPicture,
        'mockupPicture': mockupPicture,
        'gallery': gallery,

        // Design
        'hexcolor': hexcolor,

        // Sections
        'sections': sections.map(
          (key, value) => MapEntry(
            key.name,
            value.toMap(),
          ),
        ),

        // Highlights
        'keyFeatures': keyFeatures,
        'challenges': challenges,
        'learnings': learnings,

        // Hero
        'heroBackground': heroBackground,
        'phoneMockup': phoneMockup,
        'subtitle': subtitle,

        // Problem
        'problemTitle': problemTitle,
        'problem': problem,
        'problemImage': problemImage,

        // Solution
        'solutionTitle': solutionTitle,
        'solution': solution,
        'solutionImage': solutionImage,

        // Stats / Features
        'stats': stats.map((e) => e.toMap()).toList(),
        'features': features.map((e) => e.toMap()).toList(),
      };

  // ============================================================
  // FROM MAP
  // ============================================================

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      // Basic
      id: map['id'] ?? '',
      typ: ProjectType.values.firstWhere(
        (e) => e.name == map['typ'],
      ),

      // Text
      name: map['name'] ?? '',
      shortDescription: map['shortDescription'] ?? '',
      catchPhrase: map['catchPhrase'] ?? '',
      longDescription: map['longDescription'] ?? '',
      projectReason: map['projectReason'] ?? '',

      // Project info
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      durationInMonths: map['durationInMonths'] ?? 0,
      isSolo: map['isSolo'] ?? false,
      role: map['role'] ?? '',
      grade: map['grade'],
      universityContext: map['universityContext'],

      // Release
      releaseDate: map['releaseDate'] != null
          ? DateTime.tryParse(map['releaseDate'])
          : null,
      version: map['version'],
      platform: map['platform'],
      isPublished: map['isPublished'] ?? false,

      // Tech
      technologies: List<String>.from(
        map['technologies'] ?? [],
      ),
      platformLinks: (map['platformLinks'] as List<dynamic>? ?? [])
          .map(
            (e) => PlatformLink.fromMap(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList(),

      // Links
      githubUrl: map['githubUrl'] ?? '',
      liveDemoUrl: map['liveDemoUrl'],
      apkUrl: map['apkUrl'],
      playStoreUrl: map['playStoreUrl'],

      // Media
      logoPicture: map['logoPicture'] ?? '',
      aboutPicture: map['aboutPicture'] ?? '',
      previewPicture: map['previewPicture'] ?? '',
      bannerPreviewPicture: map['bannerPreviewPicture'] ?? '',
      mockupPicture: List<String>.from(
        map['mockupPicture'] ?? [],
      ),
      gallery: List<String>.from(
        map['gallery'] ?? [],
      ),

      // Design
      hexcolor: map['hexcolor'] ?? '#FFFFFF',

      // Sections
      sections: (map['sections'] as Map<String, dynamic>? ?? {}).map(
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
        map['keyFeatures'] ?? [],
      ),
      challenges: List<String>.from(
        map['challenges'] ?? [],
      ),
      learnings: List<String>.from(
        map['learnings'] ?? [],
      ),

      // Hero
      heroBackground: map['heroBackground'] ?? '',
      phoneMockup: map['phoneMockup'] ?? '',
      subtitle: map['subtitle'] ?? '',

      // Problem
      problemTitle: map['problemTitle'] ?? '',
      problem: map['problem'] ?? '',
      problemImage: map['problemImage'] ?? '',

      // Solution
      solutionTitle: map['solutionTitle'] ?? '',
      solution: map['solution'] ?? '',
      solutionImage: map['solutionImage'] ?? '',

      // Stats / Features
      stats: (map['stats'] as List<dynamic>? ?? [])
          .map(
            (e) => ProjectStat.fromMap(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList(),
      features: (map['features'] as List<dynamic>? ?? [])
          .map(
            (e) => ProjectFeature.fromMap(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList(),
    );
  }
}
