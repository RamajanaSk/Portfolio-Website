import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/Data/Models/ProjectSection.dart';
import 'package:ramajana05/Data/Models/ProjectType.dart';
import 'package:ramajana05/Data/Models/SectionType.dart';

final List<Project> dummyProjects = [
  Project(
    id: '1',
    typ: ProjectType.mobileApp,
    name: 'Traveler App',
    shortDescription: 'A Unity + OSM based travel experience app.',
    longDescription:
        'Traveler is an immersive travel experience powered by Unity + OSM. asd fasdf f adf afs dfasfd asdf ',
    projectReason: 'Created for exploring new travel routes with AR.',
    hexcolor: '#FF5533',
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: ['https://via.placeholder.com/400'],
    platformIcons: ['Unity', 'OSM'],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler is an immersive travel experience powered by Unity + OSM.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
      SectionType.mockups: ProjectSection(
        type: SectionType.mockups,
        text: 'Early-stage UI mockups showing the navigation system.',
        imageUrl: 'https://via.placeholder.com/200',
      ),
    },
  ),
  Project(
    id: '2',
    typ: ProjectType.mobileApp,
    name: 'Fitness Tracker',
    shortDescription: 'A Flutter Samsung Health integration demo.',
    longDescription:
        'Tracks workout time, steps, and calories via Samsung Health. asdf asdf af dsaf df asdf asf asdf asdf asdf asdf adf',
    projectReason: 'Demo app for integrating health tracking APIs.',
    hexcolor: '#22CC88',
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: ['https://via.placeholder.com/400'],
    platformIcons: ['Flutter', 'Samsung Health'],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text: 'Tracks workout time, steps, and calories via Samsung Health.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
    },
    extraInformation: {
      'abstract': 'This thesis explores XYZ and demonstrates ABC.',
      'motivationText': 'I wanted to research XYZ because...',
      'motivationImage': 'https://via.placeholder.com/250',
      'fullThesisPDF': 'https://myserver.com/thesis.pdf',
      'keyResults': 'Summary of experiments, results, and conclusions',
      'supervisor': 'Prof. Dr. Someone',
    },
  ),
  Project(
    id: '3',
    typ: ProjectType.virtualReality,
    name: 'Fruit Ninja VR',
    shortDescription: 'Updated version of Traveler with improved UI.',
    longDescription:
        'Traveler v2 includes new features for route planning and AR navigation. asd ad adads ad ad ad asd ad ad afasdf asdf sdfa sffsadf asdf',
    projectReason: 'Enhanced version for better UX and performance.',
    hexcolor: '#FF5531',
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [
      'https://via.placeholder.com/400',
      'https://via.placeholder.com/401'
    ],
    platformIcons: ['Unity', 'OSM'],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler v2 is an improved travel experience powered by Unity + OSM.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
      SectionType.mockups: ProjectSection(
        type: SectionType.mockups,
        text: 'UI mockups showing new navigation features.',
        imageUrl: 'https://via.placeholder.com/200',
      ),
    },
  ),
  Project(
    id: '4',
    typ: ProjectType.virtualReality,
    name: 'Fruit Ninja VR',
    shortDescription: 'Updated version of Traveler with improved UI.',
    longDescription:
        'Traveler v2 includes new features for route planning and AR navigation. asd ad adads ad ad ad asd ad ad afasdf asdf sdfa sffsadf asdf',
    projectReason: 'Enhanced version for better UX and performance.',
    hexcolor: '#FF5531',
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [
      'https://via.placeholder.com/400',
      'https://via.placeholder.com/401'
    ],
    platformIcons: ['Unity', 'OSM'],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler v2 is an improved travel experience powered by Unity + OSM.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
      SectionType.mockups: ProjectSection(
        type: SectionType.mockups,
        text: 'UI mockups showing new navigation features.',
        imageUrl: 'https://via.placeholder.com/200',
      ),
    },
  ),
  Project(
    id: '4',
    typ: ProjectType.virtualReality,
    name: 'Fruit Ninja VR',
    shortDescription: 'Updated version of Traveler with improved UI.',
    longDescription:
        'Traveler v2 includes new features for route planning and AR navigation. asd ad adads ad ad ad asd ad ad afasdf asdf sdfa sffsadf asdf',
    projectReason: 'Enhanced version for better UX and performance.',
    hexcolor: '#FF5531',
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [
      'https://via.placeholder.com/400',
      'https://via.placeholder.com/401'
    ],
    platformIcons: ['Unity', 'OSM'],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler v2 is an improved travel experience powered by Unity + OSM.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
      SectionType.mockups: ProjectSection(
        type: SectionType.mockups,
        text: 'UI mockups showing new navigation features.',
        imageUrl: 'https://via.placeholder.com/200',
      ),
    },
  ),
  Project(
    id: '4',
    typ: ProjectType.virtualReality,
    name: 'Fruit Ninja VR',
    shortDescription: 'Updated version of Traveler with improved UI.',
    longDescription:
        'Traveler v2 includes new features for route planning and AR navigation. asd ad adads ad ad ad asd ad ad afasdf asdf sdfa sffsadf asdf',
    projectReason: 'Enhanced version for better UX and performance.',
    hexcolor: '#FF5531',
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [
      'https://via.placeholder.com/400',
      'https://via.placeholder.com/401'
    ],
    platformIcons: ['Unity', 'OSM'],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler v2 is an improved travel experience powered by Unity + OSM.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
      SectionType.mockups: ProjectSection(
        type: SectionType.mockups,
        text: 'UI mockups showing new navigation features.',
        imageUrl: 'https://via.placeholder.com/200',
      ),
    },
  ),
  Project(
    id: '4',
    typ: ProjectType.virtualReality,
    name: 'Fruit Ninja VR',
    shortDescription: 'Updated version of Traveler with improved UI.',
    longDescription:
        'Traveler v2 includes new features for route planning and AR navigation. asd ad adads ad ad ad asd ad ad afasdf asdf sdfa sffsadf asdf',
    projectReason: 'Enhanced version for better UX and performance.',
    hexcolor: '#FF5531',
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [
      'https://via.placeholder.com/400',
      'https://via.placeholder.com/401'
    ],
    platformIcons: ['Unity', 'OSM'],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler v2 is an improved travel experience powered by Unity + OSM.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
      SectionType.mockups: ProjectSection(
        type: SectionType.mockups,
        text: 'UI mockups showing new navigation features.',
        imageUrl: 'https://via.placeholder.com/200',
      ),
    },
  ),
  Project(
    id: '4',
    typ: ProjectType.virtualReality,
    name: 'Fruit Ninja ssVR',
    shortDescription: 'Updated version of Traveler with improved UI.',
    longDescription:
        'Traveler v2 includes new features for route planning and AR navigation. asd ad adads ad ad ad asd ad ad afasdf asdf sdfa sffsadf asdf',
    projectReason: 'Enhanced version for better UX and performance.',
    hexcolor: '#FF5531',
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [
      'https://via.placeholder.com/400',
      'https://via.placeholder.com/401'
    ],
    platformIcons: ['Unity', 'OSM'],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler v2 is an improved travel experience powered by Unity + OSM.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
      SectionType.mockups: ProjectSection(
        type: SectionType.mockups,
        text: 'UI mockups showing new navigation features.',
        imageUrl: 'https://via.placeholder.com/200',
      ),
    },
  ),
  Project(
    id: '4',
    typ: ProjectType.virtualReality,
    name: 'Fruit Ninja VR',
    shortDescription: 'Updated version of Traveler with improved UI.',
    longDescription:
        'Traveler v2 includes new features for route planning and AR navigation. asd ad adads ad ad ad asd ad ad afasdf asdf sdfa sffsadf asdf',
    projectReason: 'Enhanced version for better UX and performance.',
    hexcolor: '#FF5531',
    logoPicture: 'https://via.placeholder.com/150',
    previewPicture: 'https://via.placeholder.com/300',
    mockupPicture: [
      'https://via.placeholder.com/400',
      'https://via.placeholder.com/401'
    ],
    platformIcons: ['Unity', 'OSM'],
    sections: {
      SectionType.about: ProjectSection(
        type: SectionType.about,
        text:
            'Traveler v2 is an improved travel experience powered by Unity + OSM.',
        imageUrl: 'https://via.placeholder.com/250',
      ),
      SectionType.mockups: ProjectSection(
        type: SectionType.mockups,
        text: 'UI mockups showing new navigation features.',
        imageUrl: 'https://via.placeholder.com/200',
      ),
    },
  ),
];
