import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/Data/Models/ProjectSection.dart';
import 'package:ramajana05/Data/Models/ProjectType.dart';
import 'package:ramajana05/Data/Models/SectionType.dart';
import 'package:ramajana05/core/utils/platform_link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Project> dummyProjects = [
  // 🔥 1. TRAVELER
  Project(
    id: '1',
    typ: ProjectType.mobileApp,
    name: 'Traveler',
    shortDescription:
        '3D travel experience using Unity and OpenStreetMap data.',
    longDescription: '...',
    projectReason: '...',
    startDate: DateTime(2024, 6),
    endDate: DateTime(2025, 2),
    durationInMonths: 8,
    isSolo: true,
    role: 'VR / Mobile Developer',
    grade: '1.0',
    universityContext: 'Bachelor Thesis',
    platformLinks: [
      PlatformLink(
        icon: FontAwesomeIcons.gamepad,
        url: "",
        tooltip: "Unity",
      ),
      PlatformLink(
        icon: FontAwesomeIcons.code,
        url: "",
        tooltip: "C#",
      ),
      PlatformLink(
        icon: FontAwesomeIcons.map,
        url: "",
        tooltip: "OpenStreetMap",
      ),
    ],
    technologies: ['Unity', 'C#', 'OpenStreetMap'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'images/traveler/traveler_logo.png',
    previewPicture: 'images/traveler/traveler_main.png',
    mockupPicture: ['images/traveler/traveler_logo.png'],
    gallery: [],
    hexcolor: '#854BED',
    keyFeatures: [],
    challenges: [],
    learnings: [],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: '',
        imageUrl: '',
      ),
    },
  ),

  // 🔥 2. FITNESS TRACKER
  Project(
    id: '2',
    typ: ProjectType.mobileApp,
    name: 'Fitness Tracker',
    shortDescription: 'Flutter app integrating Samsung Health data.',
    longDescription: '...',
    projectReason: '...',
    startDate: DateTime(2025, 3),
    endDate: DateTime(2025, 4),
    durationInMonths: 1,
    isSolo: true,
    role: 'Flutter Developer',
    platformLinks: [
      PlatformLink(
        icon: FontAwesomeIcons.flutter,
        url: "https://flutter.dev",
        tooltip: "Flutter",
      ),
      PlatformLink(
        icon: FontAwesomeIcons.github,
        url: "",
        tooltip: "GitHub",
      ),
    ],
    technologies: ['Flutter', 'Dart'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: '',
    previewPicture: '',
    mockupPicture: [],
    gallery: [],
    hexcolor: '#22CC88',
    keyFeatures: [],
    challenges: [],
    learnings: [],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: '',
        imageUrl: '',
      ),
    },
  ),

  // 🔥 3. CLOCK LOGIC
  Project(
    id: '3',
    typ: ProjectType.mobileApp,
    name: 'Clock Logic Challenge',
    shortDescription: 'Algorithmic challenge project.',
    longDescription: '...',
    projectReason: '...',
    startDate: DateTime(2024, 10),
    endDate: DateTime(2025, 1),
    durationInMonths: 3,
    isSolo: true,
    role: 'Software Developer',
    platformLinks: [
      PlatformLink(
        icon: FontAwesomeIcons.code,
        url: "https://github.com/Ramajana05/Programming-Challenge",
        tooltip: "Dart",
      ),
      PlatformLink(
        icon: FontAwesomeIcons.github,
        url: "https://github.com/Ramajana05/Programming-Challenge",
        tooltip: "GitHub",
      ),
    ],
    technologies: ['Dart'],
    githubUrl: '',
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: '',
    previewPicture: '',
    mockupPicture: [],
    gallery: [],
    hexcolor: '#4A90E2',
    keyFeatures: [],
    challenges: [],
    learnings: [],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: '',
        imageUrl: '',
      ),
    },
  ),

  // 🔥 VR PROJECTS (reuse pattern)
  Project(
    id: '4',
    typ: ProjectType.virtualReality,
    name: 'Forest',
    shortDescription: 'VR monitoring system',
    longDescription: '...',
    projectReason: '...',
    startDate: DateTime(2023, 11),
    endDate: DateTime(2024, 1),
    durationInMonths: 2,
    isSolo: false,
    role: 'Unity Developer',
    platformLinks: [
      PlatformLink(
        icon: FontAwesomeIcons.gamepad,
        url: "",
        tooltip: "Unity",
      ),
    ],
    technologies: ['Unity'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'images/forest/forest_logo.png',
    previewPicture: 'images/forest/forest_main.png',
    mockupPicture: ['images/traveler/traveler_logo.png'],
    gallery: [],
    hexcolor: '#0FFF82',
    keyFeatures: [],
    challenges: [],
    learnings: [],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: '',
        imageUrl: '',
      ),
    },
  ),
];
