import 'package:flutter/material.dart';
import 'package:ramajana05/Core/widgets/Footer.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/divider/normal_section_divider.dart';

import 'package:ramajana05/core/widgets/full_width_text.dart';

import 'package:ramajana05/features/home/presentation/sections/about_me_small_section.dart';
import 'package:ramajana05/features/home/presentation/sections/featured_project_section.dart';
import 'package:ramajana05/features/home/presentation/sections/start_section.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_Image_grid.dart';

class Homescreen extends StatefulWidget {
  final String title;
  final VoidCallback onAboutMePressed;
  const Homescreen({
    super.key,
    required this.title,
    required this.onAboutMePressed,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final project = Project(
    previewPicture: 'images/traveler/traveler_main.png',
    mockupPicture: 'images/forest/forest_main.png',
    logoPicture: 'images/traveler/logo.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: const StartSection(),
            ),
            const NeonSectionDivider(),
            AboutMeSmallSection(
              onAboutMePressed: widget.onAboutMePressed,
            ),
            const NormalSectionDivider(),
            const FullWidthText(
                text:
                    "I love building things that are not just functional, but feel good to use."),
            const NormalSectionDivider(),
            const FeaturedProjectSection(),
            //Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            //children: [
            //MetricItem(value: "2.5+", label: "Years"),
            //MetricItem(value: "10+", label: "Projects"),
            //MetricItem(value: "Flutter", label: "Focus"),
            // ],
            //),
            const NormalSectionDivider(),
            //Wrap(
            // spacing: 10,
            // runSpacing: 10,
            // children: [
            //  _badge("Flutter"),
            //  _badge("Dart"),
            //  _badge("Unity"),
            //  _badge("Kotlin"),
            // ],
            //),
            const NeonSectionDivider(),
            const FullWidthText(text: "Let’s build something meaningful."),
            const NeonSectionDivider(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

Widget _badge(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
    ),
    child: Text(text),
  );
}
