import 'SectionType.dart';

class ProjectSection {
  final SectionType type;
  String text;
  String? imageUrl;

  ProjectSection({
    required this.type,
    required this.text,
    this.imageUrl,
  });

  String get title {
    switch (type) {
      case SectionType.about:
        return "About";
      case SectionType.mockups:
        return "Mockups";
      case SectionType.gallery:
        return "Gallery";
      case SectionType.techStack:
        return "Tech Stack";
      case SectionType.contact:
        return "Contact";
    }
  }

  Map<String, dynamic> toMap() => {
        "type": type.name,
        "text": text,
        "imageUrl": imageUrl,
      };

  factory ProjectSection.fromMap(Map<String, dynamic> map) => ProjectSection(
        type: SectionType.values.firstWhere((e) => e.name == map["type"]),
        text: map["text"],
        imageUrl: map["imageUrl"],
      );
}
