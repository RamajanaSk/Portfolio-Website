import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/Data/Models/ProjectSection.dart';
import 'package:ramajana05/Data/Models/ProjectType.dart';
import 'package:ramajana05/Data/Models/SectionType.dart';

final List<Project> dummyProjects = [
  // 🔥 1. TRAVELER (dein stärkstes Projekt)
  Project(
    id: '1',
    typ: ProjectType.mobileApp,
    name: 'Traveler',
    shortDescription:
        '3D travel experience using Unity and OpenStreetMap data.',
    longDescription:
        'Traveler is a 3D-based travel application developed in Unity using OpenStreetMap data. '
        'The app allows users to explore real-world environments in an interactive way using device sensors. '
        'It combines geospatial data with immersive visualization to create a unique travel experience.',
    projectReason:
        'Developed as my Bachelor thesis to explore combining mobile development, 3D environments and real-world map data.',
    startDate: DateTime(2024, 6),
    endDate: DateTime(2025, 2),
    durationInMonths: 8,
    isSolo: true,
    role: 'VR / Mobile Developer',
    grade: '1.0',
    universityContext: 'Bachelor Thesis',
    platformIcons: ['Unity', 'C#', 'OSM'],
    technologies: ['Unity', 'C#', 'OpenStreetMap', '3D', 'Mobile Sensors'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: ['https://via.placeholder.com/400'],
    gallery: [
      'https://via.placeholder.com/401',
      'https://via.placeholder.com/402',
    ],
    hexcolor: '#854BED',
    keyFeatures: [
      'Integration of OpenStreetMap data',
      '3D world visualization',
      'Sensor-based interaction',
    ],
    challenges: [
      'Handling real-world map data',
      'Performance in 3D mobile environments',
    ],
    learnings: [
      'Working with geospatial data',
      'Unity mobile optimization',
      'Combining real-world data with 3D rendering',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler combines real-world map data with 3D environments to create an immersive travel experience.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
    },
  ),

  // 🔥 2. FITNESS TRACKER
  Project(
    id: '2',
    typ: ProjectType.mobileApp,
    name: 'Fitness Tracker',
    shortDescription: 'Flutter app integrating Samsung Health data.',
    longDescription:
        'A Flutter-based application that integrates Samsung Health APIs to track user activity data such as workout time, steps, and calories.',
    projectReason:
        'Built to understand health APIs and real-time data integration in Flutter.',
    startDate: DateTime(2025, 3),
    endDate: DateTime(2025, 4),
    durationInMonths: 1,
    isSolo: true,
    role: 'Flutter Developer',
    grade: null,
    universityContext: null,
    platformIcons: ['Flutter'],
    technologies: ['Flutter', 'Dart', 'Samsung Health API'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [],
    gallery: [],
    hexcolor: '#22CC88',
    keyFeatures: [
      'Health data integration',
      'Workout tracking',
      'Real-time updates',
    ],
    challenges: [
      'Handling external APIs',
      'Data synchronization',
    ],
    learnings: [
      'API integration in Flutter',
      'State management basics',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: 'Tracks health data using Samsung Health.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
    },
  ),

  // 🔥 3. PROGRAMMING CHALLENGE (UHR / LOGIK)
  Project(
    id: '3',
    typ: ProjectType.mobileApp,
    name: 'Clock Logic Challenge',
    shortDescription:
        'Algorithmic challenge project focused on time and logic problems.',
    longDescription:
        'This project focuses on solving programming challenges, including time-based logic problems such as clock calculations and algorithmic reasoning tasks. '
        'It demonstrates structured thinking, clean code practices, and problem-solving skills.',
    projectReason:
        'Created to improve algorithmic thinking and prepare for technical interviews.',
    startDate: DateTime(2024, 10),
    endDate: DateTime(2025, 1),
    durationInMonths: 3,
    isSolo: true,
    role: 'Software Developer',
    grade: null,
    universityContext: 'Self-learning',
    platformIcons: ['Dart'],
    technologies: ['Dart', 'Algorithms', 'Problem Solving'],
    githubUrl: 'https://github.com/Ramajana05/Programming-Challenge',
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [],
    gallery: [],
    hexcolor: '#4A90E2',
    keyFeatures: [
      'Clock-based logic problems',
      'Algorithm implementations',
      'Clean structured code',
    ],
    challenges: [
      'Edge cases in time calculations',
      'Efficient logic building',
    ],
    learnings: [
      'Improved algorithmic thinking',
      'Better problem decomposition',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Collection of algorithmic challenges focused on logical thinking.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
    },
  ),

  // 🔥 4. FOREST PROJECT
  Project(
    id: '4',
    typ: ProjectType.virtualReality,
    name: 'Forest – Monitor Your Vineyard',
    shortDescription: 'VR solution for monitoring environmental data.',
    longDescription:
        'A VR-based concept for monitoring vineyard data and environmental conditions in an interactive 3D space.',
    projectReason:
        'Exploring VR applications in agriculture and monitoring systems.',
    startDate: DateTime(2023, 11),
    endDate: DateTime(2024, 1),
    durationInMonths: 2,
    isSolo: false,
    role: 'Unity Developer',
    grade: null,
    universityContext: 'University Project',
    platformIcons: ['Unity'],
    technologies: ['Unity', 'C#', '3D'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [],
    gallery: [],
    hexcolor: '#0FFF82',
    keyFeatures: [
      '3D data visualization',
      'VR interaction',
    ],
    challenges: [
      'Designing intuitive VR UI',
    ],
    learnings: [
      'VR interaction design',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: 'VR monitoring system for vineyards.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
    },
  ),
  Project(
    id: '5',
    typ: ProjectType.virtualReality,
    name: 'Splatoon VR',
    shortDescription: 'Fast-paced VR shooter inspired by Splatoon mechanics.',
    longDescription:
        'Splatoon VR is a fast-paced multiplayer-inspired VR experience where players interact with the environment using paint-based mechanics. '
        'The project focuses on movement, interaction and game feel in a VR environment.',
    projectReason:
        'Built to explore game mechanics, interaction design and fast-paced gameplay in VR.',
    startDate: DateTime(2024, 4),
    endDate: DateTime(2024, 5),
    durationInMonths: 1,
    isSolo: false,
    role: 'Unity Developer',
    grade: null,
    universityContext: 'Game Development Course',
    platformIcons: ['Unity'],
    technologies: ['Unity', 'C#', 'VR', 'Game Mechanics'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [],
    gallery: [],
    hexcolor: '#FF6D93',
    keyFeatures: [
      'Paint-based interaction system',
      'VR movement mechanics',
      'Fast-paced gameplay',
    ],
    challenges: [
      'Balancing movement in VR',
      'Performance optimization',
    ],
    learnings: [
      'Game feel in VR',
      'Interaction design',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: 'VR shooter with paint mechanics inspired by Splatoon.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
    },
  ),
  Project(
    id: '6',
    typ: ProjectType.virtualReality,
    name: 'Perspective',
    shortDescription:
        'VR project exploring perception and spatial interaction.',
    longDescription:
        'Perspective is an experimental VR project focusing on how users perceive space and depth in virtual environments. '
        'It explores interaction and visual transformation mechanics.',
    projectReason:
        'To explore perception and user interaction in VR environments.',
    startDate: DateTime(2024, 2),
    endDate: DateTime(2024, 3),
    durationInMonths: 1,
    isSolo: true,
    role: 'VR Developer',
    grade: null,
    universityContext: 'University Project',
    platformIcons: ['Unity'],
    technologies: ['Unity', 'C#', 'VR'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [],
    gallery: [],
    hexcolor: '#009DAA',
    keyFeatures: [
      'Spatial interaction',
      'Visual perception mechanics',
    ],
    challenges: [
      'User orientation in VR',
    ],
    learnings: [
      'Understanding depth perception in VR',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: 'Experimental VR project exploring perception.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
    },
  ),
  Project(
    id: '7',
    typ: ProjectType.virtualReality,
    name: 'Race Quit',
    shortDescription:
        'VR racing concept with focus on player interaction and speed.',
    longDescription:
        'Race Quit is a VR racing prototype focused on speed, player control and immersive environments. '
        'It explores movement, control responsiveness and gameplay feedback.',
    projectReason:
        'Built to experiment with racing mechanics and immersion in VR.',
    startDate: DateTime(2024, 6),
    endDate: DateTime(2024, 7),
    durationInMonths: 1,
    isSolo: false,
    role: 'Unity Developer',
    grade: null,
    universityContext: 'Game Development Project',
    platformIcons: ['Unity'],
    technologies: ['Unity', 'C#', 'VR', 'Physics'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [],
    gallery: [],
    hexcolor: '#19225F',
    keyFeatures: [
      'Racing mechanics',
      'VR movement system',
    ],
    challenges: [
      'Motion sickness handling',
      'Physics tuning',
    ],
    learnings: [
      'Movement systems in VR',
      'Player feedback loops',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: 'VR racing prototype focusing on speed and immersion.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
    },
  ),
  Project(
    id: '8',
    typ: ProjectType.virtualReality,
    name: 'Fruit Ninja VR',
    shortDescription: 'VR slicing game inspired by Fruit Ninja.',
    longDescription:
        'A VR game where players slice objects using hand-based interaction. '
        'Focus is on responsiveness, interaction precision and satisfying feedback.',
    projectReason:
        'To explore interaction design and physics-based gameplay in VR.',
    startDate: DateTime(2024, 1),
    endDate: DateTime(2024, 2),
    durationInMonths: 1,
    isSolo: true,
    role: 'Unity Developer',
    grade: null,
    universityContext: 'Game Development Course',
    platformIcons: ['Unity'],
    technologies: ['Unity', 'C#', 'VR', 'Physics'],
    githubUrl: null,
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [],
    gallery: [],
    hexcolor: '#FF5531',
    keyFeatures: [
      'Hand-based slicing interaction',
      'Physics-based objects',
    ],
    challenges: [
      'Precise interaction detection',
    ],
    learnings: [
      'Interaction systems in VR',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: 'VR slicing game with physics-based interaction.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
    },
  ),
];
