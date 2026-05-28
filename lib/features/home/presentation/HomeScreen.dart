import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';

import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/divider/normal_section_divider.dart';

import 'package:ramajana05/core/widgets/full_width_text.dart';

import 'package:ramajana05/features/about/presentation/sections/featured_work_and_technologies_section.dart';
import 'package:ramajana05/features/about/presentation/sections/metric_section.dart';

import 'package:ramajana05/features/home/presentation/sections/about_me_small_section.dart';
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

  final scrollController = ScrollController();

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: const StartSection(),
            ),
            const NeonSectionDivider(),
            const NeonSectionDivider(),
            AboutMeSmallSection(
              onAboutMePressed: widget.onAboutMePressed,
            ),
            const NormalSectionDivider(),
            const FeaturedWorkAndTechnologiesSection(),
            const NeonSectionDivider(),
            const MetricsSection(),
            const NeonSectionDivider(),
            FullWidthText(text: context.l10n.letsBuild),
            const NeonSectionDivider(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
