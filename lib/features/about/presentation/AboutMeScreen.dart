import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';

import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/divider/normal_section_divider.dart';

import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/full_width_text.dart';

import 'package:ramajana05/features/about/presentation/sections/about_me_section.dart';
import 'package:ramajana05/features/about/presentation/sections/education_section.dart';
import 'package:ramajana05/features/about/presentation/sections/experience_section.dart';
import 'package:ramajana05/features/about/presentation/sections/featured_work_and_technologies_section.dart';

import 'package:ramajana05/features/about/presentation/sections/skills_overview_section.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const NeonSectionDivider(),
          FullWidthText(text: context.l10n.whatMakesMeSpecial),
          const NeonSectionDivider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutMeSection(),
                //SkillBarSection(skills: skills),
                NormalSectionDivider(),
                SkillsOverviewSection(),
                FeaturedWorkAndTechnologiesSection(),
                NormalSectionDivider(),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ExperienceSection()),
                  SizedBox(width: 80),
                  Expanded(child: EducationSection()),
                ],
              ),
            ),
          ),
          const SizedBox(height: 80),
          const NeonSectionDivider(),
          const Footer(),
        ],
      ),
    );
  }
}
