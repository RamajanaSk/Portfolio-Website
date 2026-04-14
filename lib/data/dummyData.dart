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
        'A 3D social travel experience combining real-world movement with interactive map exploration.',
    catchPhrase: "Where Gaming meets Social Media",
    longDescription:
        'Traveler was developed as a response to the growing disconnect between digital and physical experiences. The goal was to create an application that encourages users to explore their real-world environment while still enjoying interactive digital features.\n\n'
        'The app combines Flutter for a modern, intuitive UI with Unity for real-time 3D rendering. Using OpenStreetMap data, users can visualize their surroundings in a dynamic 3D environment and see both their own position and that of their friends.\n\n'
        'By merging social interaction, geolocation, and immersive visualization, Traveler transforms movement into a shared experience and motivates users to actively explore their environment instead of passively consuming content.',
    projectReason:
        'The motivation behind Traveler was to counterbalance excessive screen time with meaningful real-world interaction. Instead of replacing reality, the app enhances it by making exploration engaging, social, and visually immersive.\n\n'
        'The project also served as an opportunity to combine multiple technologies (Flutter + Unity + geolocation services) into one cohesive product and to explore how hybrid systems can deliver both performance and usability.',
    startDate: DateTime(2024, 6),
    endDate: DateTime(2025, 2),
    durationInMonths: 8,
    isSolo: true,
    role: 'Mobile & Unity Developer',
    grade: '1.0',
    universityContext: 'Bachelor Thesis',
    platformLinks: [
      const PlatformLink(
        icon: FontAwesomeIcons.unity,
        url: "",
        tooltip: "Unity",
      ),
      PlatformLink(
        icon: FontAwesomeIcons.flutter,
        url: "",
        tooltip: "Flutter",
      ),
      PlatformLink(
        icon: FontAwesomeIcons.map,
        url: "",
        tooltip: "OpenStreetMap",
      ),
    ],
    technologies: ['Flutter', 'Unity', 'C#', 'OpenStreetMap', 'Geolocation'],
    githubUrl: "https://github.com/RamajanaSk/Portfolio-Website",
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'images/traveler/traveler_logo.png',
    previewPicture: 'images/traveler/traveler_main.png',
    mockupPicture: ['images/traveler/traveler_logo.png'],
    gallery: ['images/traveler/3D_unity_map.png'],
    hexcolor: '#854BED',
    keyFeatures: [
      'Real-time location tracking and visualization',
      '3D map rendering using Unity',
      'Integration of OpenStreetMap data',
      'Social interaction through shared locations',
      'Cross-platform mobile UI built with Flutter',
    ],
    challenges: [
      'Integrating Unity with Flutter in a performant way',
      'Handling real-time geolocation updates efficiently',
      'Rendering large map datasets without performance drops',
      'Synchronizing user positions in real time',
    ],
    learnings: [
      'How to combine multiple frameworks (Flutter + Unity) in one system',
      'Working with geospatial data and map APIs',
      'Optimizing performance in real-time applications',
      'Designing user experiences that bridge digital and physical interaction',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler is a project focused on bringing digital interaction into the real world. Instead of isolating users, it encourages exploration, movement, and shared experiences through immersive 3D visualization.',
        imageUrl: 'images/traveler/traveler_main.png',
      ),
    },
  ),

  Project(
    id: '2',
    typ: ProjectType.mobileApp,
    name: 'Fitness Tracker',
    shortDescription: 'Flutter app integrating Samsung Health data.',
    catchPhrase: "Monitor your Vineyard",
    longDescription:
        'The app is designed as a response TO STRENGTHEN THE CONNECTION BETWEEN VIRTUAL AND PHYSICAL WORLDS. THE AIM IS TO INSPIRE USERS TO BECOME ACTIVE AND EXPERIENCE PERSONAL ADVENTURES, RATHER THAN LOSING THEMSELVES IN VIRTUAL REALITIES. BUILT WITH FLUTTER FOR A SLEEK AND USER-FRIENDLY UI, AND POWERED BY UNITY FOR HIGH-PERFORMANCE 3D RENDERING, THE APP FEATURES AN IMMERSIVE STREET VIEW-BASED MAP THAT LETS USERS SEE THEIR LOCATION AND THAT OF THEIR FRIENDS IN REAL TIME. THIS SEAMLESS INTEGRATION CREATES AN EASY-TO-USE EXPERIENCE THAT BRINGS EXPLORATION AND CONNECTION TO LIFE.',
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
    githubUrl: "https://github.com/RamajanaSk/Portfolio-Website",
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
    catchPhrase: "Where Gaming meets Social Media",
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

  // 🔥 Forest
  Project(
    id: '4',
    typ: ProjectType.virtualReality,
    name: 'Forest',
    shortDescription: 'VR monitoring system',
    catchPhrase: "Where Gaming meets Social Media",
    longDescription:
        'The app is designed as a response TO STRENGTHEN THE CONNECTION BETWEEN VIRTUAL AND PHYSICAL WORLDS. THE AIM IS TO INSPIRE USERS TO BECOME ACTIVE AND EXPERIENCE PERSONAL ADVENTURES, RATHER THAN LOSING THEMSELVES IN VIRTUAL REALITIES. BUILT WITH FLUTTER FOR A SLEEK AND USER-FRIENDLY UI, AND POWERED BY UNITY FOR HIGH-PERFORMANCE 3D RENDERING, THE APP FEATURES AN IMMERSIVE STREET VIEW-BASED MAP THAT LETS USERS SEE THEIR LOCATION AND THAT OF THEIR FRIENDS IN REAL TIME. THIS SEAMLESS INTEGRATION CREATES AN EASY-TO-USE EXPERIENCE THAT BRINGS EXPLORATION AND CONNECTION TO LIFE.',
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
    githubUrl: "https://github.com/RamajanaSk/Portfolio-Website",
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'images/forest/forest_logo.png',
    previewPicture: 'images/forest/forest_main.png',
    mockupPicture: ['images/traveler/traveler_logo.png'],
    gallery: ['images/forest/forest_digital.png'],
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
