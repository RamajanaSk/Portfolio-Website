import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/hexcolor.dart';

import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';

import 'package:ramajana05/core/widgets/divider/normal_section_divider.dart';
import 'package:ramajana05/data/models/Project.dart';
import 'package:ramajana05/data/models/ProjectVersion.dart';
import 'package:ramajana05/features/projects/presentation/section/about_project_section.dart';
import 'package:ramajana05/features/projects/presentation/section/core_feature_section.dart';
import 'package:ramajana05/features/projects/presentation/section/hero_section.dart';

import 'package:ramajana05/features/projects/presentation/section/project_problem_and_experience_section.dart';
import 'package:ramajana05/features/projects/presentation/section/project_showcase_section.dart';
import 'package:ramajana05/features/projects/presentation/section/version_history_section.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;
  final VoidCallback onBack;

  const ProjectDetailScreen({
    super.key,
    required this.project,
    required this.onBack,
  });

  static const quoteyCoreFeatures = [
    CoreFeature(
      title: 'Daily Quote',
      description: 'A fresh dose of wisdom every morning.',
      image: 'assets/images/traveler/datenbank.png',
    ),
    CoreFeature(
      title: 'Mood & Reflection',
      description: 'Track your mood and write reflections.',
      image: 'assets/images/traveler/view.png',
    ),
    CoreFeature(
      title: 'Explore Worldviews',
      description: 'Dive into different philosophies.',
      image: 'assets/images/traveler/software_arch',
    ),
    CoreFeature(
      title: 'Author Profiles',
      description: 'Learn about the minds behind the ideas.',
      image: 'assets/images/quotey/features/authors.png',
    ),
    CoreFeature(
      title: 'Collections',
      description: 'Organize quotes, authors and books.',
      image: 'assets/images/quotey/features/collections.png',
    ),
  ];
  static const quoteyVersions = [
    ProjectVersion(
      version: '1.0.0',
      title: 'First Release',
      date: 'Jan 5, 2024',
      description: 'The beginning of Quotey: a focused daily quote '
          'experience built around discovering and saving '
          'meaningful ideas.',
      features: [
        'Daily Quotes',
        'Favorites',
        'Collection',
      ],
      screenshots: [
        'assets/images/traveler/buildings.png',
        'assets/images/quotey/version_1_0/collection.png',
      ],
      type: 'Initial',
    ),
    ProjectVersion(
      version: '1.1.0',
      title: 'Reflections & Collections',
      date: 'Feb 10, 2024',
      description: 'Quotes became more personal. Users could capture '
          'their thoughts and build their own collection.',
      features: [
        'Reflections',
        'Collections',
        'Saved Thoughts',
      ],
      screenshots: [
        'assets/images/quotey/version_1_1/home.png',
        'assets/images/quotey/version_1_1/reflection.png',
        'assets/images/quotey/version_1_1/collection.png',
      ],
    ),
    ProjectVersion(
      version: '1.2.0',
      title: 'Explore Worldviews',
      date: 'Mar 2, 2024',
      description: 'Quotey expanded beyond individual quotes by '
          'connecting ideas to philosophical worldviews.',
      features: [
        'Worldview Map',
        'Worldview Details',
        'Discovery',
      ],
      screenshots: [
        'assets/images/quotey/version_1_2/worldviews.png',
        'assets/images/quotey/version_1_2/details.png',
      ],
    ),
    ProjectVersion(
      version: '1.3.0',
      title: 'Authors & Books',
      date: 'Apr 8, 2024',
      description: 'Author profiles and books made it possible to '
          'explore the people and works behind each idea.',
      features: [
        'Author Profiles',
        'Books',
        'Advanced Search',
      ],
      screenshots: [
        'assets/images/quotey/version_1_3/authors.png',
        'assets/images/quotey/version_1_3/books.png',
        'assets/images/quotey/version_1_3/search.png',
      ],
    ),
    ProjectVersion(
      version: '1.4.0',
      title: 'Moods & Statistics',
      date: 'May 10, 2024',
      description: 'Mood tracking and statistics introduced a more '
          'personal layer to the Quotey experience.',
      features: [
        'Mood Tracking',
        'Streaks',
        'Statistics',
      ],
      screenshots: [
        'assets/images/quotey/version_1_4/mood.png',
        'assets/images/quotey/version_1_4/stats.png',
      ],
    ),
    ProjectVersion(
      version: '2.0.0',
      title: 'Major Update',
      date: 'Jun 15, 2024',
      description: 'A complete evolution of Quotey with a redesigned '
          'interface, deeper personalization and improved '
          'performance.',
      features: [
        'New UI',
        'Mood Tracking',
        'Statistics',
        'Performance',
      ],
      screenshots: [
        'assets/images/quotey/version_2_0/today.png',
        'assets/images/quotey/version_2_0/stats.png',
        'assets/images/quotey/version_2_0/collection.png',
      ],
      type: 'Major',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //const PhoneMockupStack(
            //frontImagePath: 'assets/images/traveler/datenbank.png',
            //backImagePath: 'assets/images/traveler/datenbank.png',
            //width: 300,
            //backScale: 0.90,
            //backXFactor: 0.70,
            //backOffsetY: 60,
            //),
            HeroSection(project: project),
            NormalSectionDivider(color: project.hexcolor.toColor()),
            AboutProjectSection(project: project),
            NormalSectionDivider(color: project.hexcolor.toColor()),
            const ProjectProblemAndExperienceSection(),
            NormalSectionDivider(color: project.hexcolor.toColor()),
            CoreFeaturesSection(
              features: quoteyCoreFeatures,
            ),
            NormalSectionDivider(color: project.hexcolor.toColor()),
            const VersionHistorySection(
              versions: quoteyVersions,
            ),
            NormalSectionDivider(color: project.hexcolor.toColor()),
            ProjectShowcaseSection(
              project: project,
            ),
            const SizedBox(height: 50),
            const NeonSectionDivider(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
