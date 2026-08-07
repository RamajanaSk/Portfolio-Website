import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/Data/Models/ProjectSection.dart';
import 'package:ramajana05/Data/Models/ProjectType.dart';
import 'package:ramajana05/Data/Models/SectionType.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/utils/platform_link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Project> getDummyProjects(BuildContext context) {
  return [
    Project(
      id: '1',
      typ: ProjectType.mobileApp,
      name: 'TRAVELER REMAKE',
      shortDescription: context.l10n.travelerRemakeShortDescription,
      catchPhrase: context.l10n.travelerRemakeCatchPhrase,
      longDescription: context.l10n.travelerRemakeLongDescription,
      projectReason: context.l10n.travelerRemakeProjectReason,
      startDate: DateTime(2026, 6),
      endDate: DateTime(2026, 6),
      durationInMonths: 8,
      isSolo: true,
      role: 'MOBILE DEVELOPER',
      grade: '',
      universityContext: 'PRIVATE PROJECT',
      platformLinks: [
        const PlatformLink(
          icon: FontAwesomeIcons.flutter,
          url: '',
          tooltip: 'Flutter',
        ),
      ],
      technologies: [
        'Flutter',
        'Dart',
        'OpenStreetMap',
        'GPS',
        'Clean Architecture',
        'Provider',
        'REST API',
        'Responsive Design',
      ],
      githubUrl: 'https://github.com/RamajanaSk/Traveler-Remake',
      liveDemoUrl: null,
      apkUrl: null,
      logoPicture: 'assets/images/traveler_remake/waiting.png',
      previewPicture: 'assets/images/traveler_remake/traveler_main.png',
      bannerPreviewPicture: 'assets/images/traveler_remake/waiting.png',
      aboutPicture: 'assets/images/traveler_remake/waiting.png',
      mockupPicture: [
        'assets/images/traveler_remake/waiting.png',
      ],
      gallery: [
        'assets/images/traveler_remake/map_discovery.png',
        'assets/images/traveler_remake/stuttgart_map_small.png',
        'assets/images/traveler_remake/stuttgart_map_big.png'
      ],
      hexcolor: '#2196F3',
      keyFeatures: [
        context.l10n.travelerRemakeFeature1,
        context.l10n.travelerRemakeFeature2,
        context.l10n.travelerRemakeFeature3,
        context.l10n.travelerRemakeFeature4,
        context.l10n.travelerRemakeFeature5,
      ],
      challenges: [
        context.l10n.travelerRemakeChallenge1,
        context.l10n.travelerRemakeChallenge2,
        context.l10n.travelerRemakeChallenge3,
        context.l10n.travelerRemakeChallenge4,
      ],
      learnings: [
        context.l10n.travelerRemakeLearning1,
        context.l10n.travelerRemakeLearning2,
        context.l10n.travelerRemakeLearning3,
        context.l10n.travelerRemakeLearning4,
      ],
      sections: {
        SectionType.about: ProjectSection(
          type: SectionType.about,
          text:
              'Traveler is a project focused on bringing digital interaction into the real world. Instead of isolating users, it encourages exploration, movement, and shared experiences through immersive 3D visualization.',
          imageUrl: 'assets/images/traveler/traveler_main.png',
        ),
      },
      heroBackground: 'assets/images/traveler_remake/hero_image.png',
      phoneMockup: 'assets/images/traveler_remake/phone_mockup.png',
      subtitle: context.l10n.travelerSubtitle,
      githubUrl1: '',
      demoUrl: '',
      playStoreUrl: '',
      problem: '',
      solution: '',
    ),
    Project(
      id: '2',
      typ: ProjectType.mobileApp,
      name: 'TRAVELER',
      shortDescription: context.l10n.travelerShortDescription,
      catchPhrase: context.l10n.travelerCatchPhrase,
      longDescription: context.l10n.travelerLongDescription,
      projectReason: context.l10n.travelerProjectReason,
      startDate: DateTime(2024, 6),
      endDate: DateTime(2025, 2),
      durationInMonths: 8,
      isSolo: true,
      role: 'MOBILE & UNITY DEVELOPER',
      grade: '1.0',
      universityContext: 'BACHELOR THESIS',
      platformLinks: [
        const PlatformLink(
          icon: FontAwesomeIcons.unity,
          url: "",
          tooltip: "Unity",
        ),
        const PlatformLink(
          icon: FontAwesomeIcons.flutter,
          url: "",
          tooltip: "Flutter",
        ),
      ],
      technologies: [
        'Flutter',
        'Dart',
        'Unity',
        'C#',
        'OpenStreetMap',
        'GPS',
      ],
      githubUrl: "https://github.com/RamajanaSk/OPENSTREETMAP-3D-MAP",
      liveDemoUrl: null,
      apkUrl: null,
      logoPicture: 'assets/images/traveler/traveler_logo.png',
      previewPicture: 'assets/images/traveler/traveler_main.png',
      bannerPreviewPicture: 'assets/images/traveler/3D_unity_map.png',
      aboutPicture: 'assets/images/traveler/traveler_main.png',
      mockupPicture: ['assets/images/traveler/traveler_logo.png'],
      gallery: [
        'assets/images/traveler/3D_unity_map.png',
        'assets/images/traveler/3D_top_view_stuttgart.png',
        'assets/images/traveler/3D_side_view.png',
        'assets/images/traveler/3D_player.png',
        'assets/images/traveler/buildings.png',
        'assets/images/traveler/mockup_1.png',
        'assets/images/traveler/mockup_2.png',
        'assets/images/traveler/view.png',
        'assets/images/traveler/software_arch.png',
        'assets/images/traveler/datenbank.png',
      ],
      hexcolor: '#854BED',
      keyFeatures: [
        context.l10n.travelerFeature1,
        context.l10n.travelerFeature2,
        context.l10n.travelerFeature3,
        context.l10n.travelerFeature4,
        context.l10n.travelerFeature5,
      ],
      challenges: [
        context.l10n.travelerChallenge1,
        context.l10n.travelerChallenge2,
        context.l10n.travelerChallenge3,
        context.l10n.travelerChallenge4,
      ],
      learnings: [
        context.l10n.travelerLearning1,
        context.l10n.travelerLearning2,
        context.l10n.travelerLearning3,
        context.l10n.travelerLearning4,
      ],
      sections: {
        SectionType.about: ProjectSection(
          type: SectionType.about,
          text:
              'Traveler is a project focused on bringing digital interaction into the real world. Instead of isolating users, it encourages exploration, movement, and shared experiences through immersive 3D visualization.',
          imageUrl: 'assets/images/traveler/traveler_main.png',
        ),
      },
      heroBackground: 'assets/images/traveler_remake/hero_image.png',
      phoneMockup: 'assets/images/traveler_remake/phone_mockup.png',
      subtitle: context.l10n.travelerSubtitle,
      githubUrl1: '',
      demoUrl: '',
      playStoreUrl: '',
      problem: '',
      solution: '',
    ),
    /*
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
      const PlatformLink(
        icon: FontAwesomeIcons.flutter,
        url: "https://flutter.dev",
        tooltip: "Flutter",
      ),
      const PlatformLink(
        icon: FontAwesomeIcons.github,
        url: "",
        tooltip: "GitHub",
      ),
    ],
    technologies: ['Flutter', 'Dart', 'Google Maps'],
    githubUrl: "https://github.com/RamajanaSk/Portfolio-Website",
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: '',
    aboutPicture: '',
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
      const PlatformLink(
        icon: FontAwesomeIcons.code,
        url: "https://github.com/Ramajana05/Programming-Challenge",
        tooltip: "Dart",
      ),
      const PlatformLink(
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
    aboutPicture: '',
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
  */
    Project(
      id: '4',
      typ: ProjectType.virtualReality,
      name: 'FOREST',
      shortDescription: context.l10n.forestShortDescription,
      catchPhrase: context.l10n.forestCatchPhrase,
      longDescription: context.l10n.forestLongDescription,
      projectReason: context.l10n.forestProjectReason,
      startDate: DateTime(2023, 11),
      endDate: DateTime(2024, 1),
      durationInMonths: 2,
      isSolo: false,
      role: 'FLUTTER DEVELOPER',
      platformLinks: [
        const PlatformLink(
          icon: FontAwesomeIcons.flutter,
          url: "",
          tooltip: "Flutter",
        ),
      ],
      technologies: ['Flutter', 'Dart', 'Google Maps', 'GPS'],
      githubUrl: "https://github.com/RamajanaSk/MDMA-APP",
      liveDemoUrl: null,
      apkUrl: null,
      logoPicture: 'assets/images/forest/forest_logo.png',
      aboutPicture: 'assets/images/forest/about_me.png',
      previewPicture: 'assets/images/forest/forest_main.png',
      bannerPreviewPicture: 'assets/images/forest/forest_thumbnail.png',
      mockupPicture: ['assets/images/traveler/traveler_logo.png'],
      gallery: [
        'assets/images/forest/forest_thumbnail.png',
        'assets/images/forest/karte.png',
        'assets/images/forest/sensoren.png',
        'assets/images/forest/benutzerfreundlich.png',
        'assets/images/forest/software_arch.png',
        'assets/images/forest/mockup_1.png',
        'assets/images/forest/mockup_2.png',
        'assets/images/forest/herunterladen.png',
      ],
      hexcolor: '#0FFF82',
      keyFeatures: [
        context.l10n.forestFeature1,
        context.l10n.forestFeature2,
        context.l10n.forestFeature3,
        context.l10n.forestFeature4,
        context.l10n.forestFeature5
      ],
      challenges: [
        context.l10n.forestChallenge1,
        context.l10n.forestChallenge2,
        context.l10n.forestChallenge3,
        context.l10n.forestChallenge4
      ],
      learnings: [
        context.l10n.forestLearning1,
        context.l10n.forestLearning2,
        context.l10n.forestLearning3,
        context.l10n.forestLearning4
      ],
      sections: {
        SectionType.about: ProjectSection(
          type: SectionType.about,
          text: '',
          imageUrl: '',
        ),
      },
      heroBackground: '',
      phoneMockup: 'assets/images/traveler_remake/phone_mockup.png',
      subtitle: '',
      githubUrl1: '',
      demoUrl: '',
      playStoreUrl: '',
      problem: '',
      solution: '',
    ),
    /*
  Project(
    id: '5',
    typ: ProjectType.virtualReality,
    name: 'Bike Simulator VR',
    shortDescription:
        'A shared VR cycling experience connecting physical movement with immersive gameplay.',
    catchPhrase: 'Ride Together. Move Together.',
    longDescription:
        'Bike Simulator VR is a collaborative virtual reality experience designed to bridge the gap between physical activity and digital interaction. '
        'The project encourages users to stay active by transforming real-world movement into an immersive multiplayer VR experience. '
        'Built with Unity and C#, the application features a shared 3D environment where players can cycle, interact, and explore together in real time. '
        'The project combines movement-based gameplay, social interaction, and immersive virtual environments to create a more engaging and active VR experience.',
    projectReason:
        'The project was created to explore how virtual reality can encourage physical activity and meaningful social interaction instead of passive digital consumption. '
        'The focus was on combining real-world movement with immersive multiplayer experiences.',
    startDate: DateTime(2022, 04),
    endDate: DateTime(2022, 07),
    durationInMonths: 3,
    isSolo: false,
    role: 'Unity VR Developer',
    platformLinks: [
      const PlatformLink(
        icon: FontAwesomeIcons.unity,
        url: "",
        tooltip: "Unity",
      ),
    ],
    technologies: [
      'Unity',
      'C#',
      'Virtual Reality',
      'Multiplayer Systems',
      '3D Development',
      'Real-Time Interaction',
      'Motion-Based Gameplay',
    ],
    githubUrl: "https://github.com/RamajanaSk/Portfolio-Website",
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'images/bike_simulator_vr/bike_simulator_logo.png',
    previewPicture: 'images/bike_simulator_vr/bike_simulator_preview.png',
    aboutPicture: 'images/bike_simulator_vr/bike_simulator_ui.png',
    mockupPicture: [
      'images/traveler/traveler_logo.png',
    ],
    gallery: [
      'images/bike_simulator_vr/bike_simulator_starting_screen.png',
      'images/bike_simulator_vr/bike_simulator_bike.png',
      'images/bike_simulator_vr/bike_simulator_audi.png',
    ],
    hexcolor: '#ff0f3f',
    keyFeatures: [
      'Shared multiplayer VR environment',
      'Real-time player interaction',
      'Immersive 3D world exploration',
      'Movement-based gameplay mechanics',
      'Social VR experience',
      'Interactive cycling simulation',
    ],
    challenges: [
      'Synchronizing multiple users in a shared VR environment',
      'Optimizing performance for smooth VR experiences',
      'Designing intuitive VR interactions and controls',
      'Handling real-time multiplayer communication',
      'Creating immersive movement-based gameplay',
    ],
    learnings: [
      'Unity VR development workflows',
      'Real-time multiplayer concepts',
      'Performance optimization for VR applications',
      '3D interaction and UX design',
      'Collaborative gameplay systems',
      'Motion-driven game mechanics',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Bike Simulator VR is a collaborative virtual reality project focused on combining physical movement with immersive multiplayer gameplay. '
            'Users can interact within a shared 3D environment while experiencing movement-driven mechanics designed to promote activity, exploration, and social interaction.',
        imageUrl: '',
      ),
    },
  ),
  Project(
    id: '6',
    typ: ProjectType.virtualReality,
    name: 'Fruit Ninja VR',
    shortDescription:
        'A fast-paced VR fruit slicing experience focused on immersive motion-based gameplay.',
    catchPhrase: 'Slice Fast. React Faster.',
    longDescription:
        'Fruit Ninja VR is an immersive virtual reality experience that brings the classic arcade gameplay into a fully interactive 3D environment. '
        'Built with Unity and C#, the project focuses on fast reaction times, physical movement, and immersive VR interactions. '
        'Players use motion-controlled swords to slice incoming fruits in real time while avoiding obstacles and maintaining combo streaks. '
        'The experience combines arcade-style gameplay with responsive VR mechanics, creating an engaging and energetic virtual reality experience.',
    projectReason:
        'The project was created to explore immersive VR interaction systems and motion-driven gameplay mechanics. '
        'The focus was on translating fast-paced arcade gameplay into a physically interactive virtual reality environment.',
    startDate: DateTime(2022, 01),
    endDate: DateTime(2022, 03),
    durationInMonths: 3,
    isSolo: false,
    role: 'Unity VR Developer',
    platformLinks: [
      const PlatformLink(
        icon: FontAwesomeIcons.unity,
        url: "",
        tooltip: "Unity",
      ),
    ],
    technologies: [
      'Unity',
      'C#',
      'Virtual Reality',
      '3D Development',
      'Motion Tracking',
      'Physics Systems',
      'Real-Time Interaction',
      'Game Development',
      'Particle Effects',
      'Motion-Based Gameplay',
    ],
    githubUrl: "https://github.com/RamajanaSk/Portfolio-Website",
    liveDemoUrl: null,
    apkUrl: null,
    logoPicture: 'images/fruit_ninja_vr/fruit_ninja_vr_logo.png',
    previewPicture: 'images/fruit_ninja_vr/fruit_ninja_vr_preview.png',
    aboutPicture: 'images/fruit_ninja_vr/fruit_ninja_vr_about.png',
    mockupPicture: [
      'images/fruit_ninja_vr/fruit_ninja_vr_mockup.png',
    ],
    gallery: [
      'images/fruit_ninja_vr/fruit_ninja_vr_start.png',
      'images/fruit_ninja_vr/fruit_ninja_vr_gameplay.png',
      'images/fruit_ninja_vr/fruit_ninja_vr_environment.png',
    ],
    hexcolor: '#FFA640',
    keyFeatures: [
      'Immersive VR fruit slicing mechanics',
      'Motion-controlled sword interactions',
      'Fast-paced arcade gameplay',
      'Interactive 3D environments',
      'Combo and score-based gameplay',
      'Responsive real-time interactions',
    ],
    challenges: [
      'Creating responsive VR sword mechanics',
      'Optimizing performance for smooth VR gameplay',
      'Designing intuitive motion-based controls',
      'Balancing gameplay speed and player comfort',
      'Implementing satisfying visual and particle effects',
    ],
    learnings: [
      'Unity VR interaction systems',
      'Motion-driven gameplay mechanics',
      'VR performance optimization',
      'Real-time collision and physics handling',
      '3D game environment design',
      'Interactive feedback systems',
    ],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Fruit Ninja VR is a fast-paced virtual reality experience focused on immersive interaction and movement-driven gameplay. '
            'Players physically slice flying fruits using motion-controlled swords inside a stylized 3D VR environment designed to create an energetic and engaging arcade experience.',
        imageUrl: '',
      ),
    },
  ),*/
  ];
}
