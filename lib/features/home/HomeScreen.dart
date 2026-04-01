import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ramajana05/Core/widgets/Footer.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/cards/info_card.dart';

import 'package:ramajana05/core/widgets/full_width_text.dart';
import 'package:ramajana05/core/widgets/metric_item.dart';
import 'package:ramajana05/core/widgets/neon_background_secetion.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';
import 'package:ramajana05/features/Home/HomeScreen.dart';

import 'package:ramajana05/features/about/presentation/widget/sections/about_me_section.dart';
import 'package:ramajana05/features/home/widgets/Sections/about_me_small_section.dart';
import 'package:ramajana05/features/home/widgets/Sections/featured_project_section.dart';
import 'package:ramajana05/features/home/widgets/skill_chip.dart';

import 'package:ramajana05/features/home/widgets/start_section.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.title});

  final String title;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _titleKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

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
            const NeonGradientSection(),
            const AboutMeSmallSection(),
            const FeaturedProjectSection(),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _badge("Flutter"),
                _badge("Dart"),
                _badge("Unity"),
                _badge("Kotlin"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MetricItem(value: "2.5+", label: "Years"),
                MetricItem(value: "10+", label: "Projects"),
                MetricItem(value: "Flutter", label: "Focus"),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 60),
              height: 1,
            ),

            const NeonGradientSection(),
            const FullWidthText(
                text:
                    "I love building things that are not just functional, but feel good to use."),

            const NeonGradientSection(),
            const Footer(),
            // Adding the SkillsSection here
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
