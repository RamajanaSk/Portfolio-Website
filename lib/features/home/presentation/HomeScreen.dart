import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ramajana05/core/controller/home_scroll_controller.dart';
import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/responsive.dart/responsive_layout.dart';

import 'package:ramajana05/features/about/presentation/sections/featured_work_and_technologies_section.dart';
import 'package:ramajana05/features/home/presentation/sections/about_me_small_section.dart';
import 'package:ramajana05/features/home/presentation/sections/start_section.dart';
import 'package:ramajana05/features/home/presentation/widgets/home_cta_section.dart';
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
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        controller: HomeScrollController.controller,
        child: Column(
          children: [
            ResponsiveLayout(
              // MOBILE
              mobile: const StartSection(),

              // DESKTOP
              desktop: SizedBox(
                width: double.infinity,
                height: (screenHeight * 0.72).clamp(560.0, 680.0),
                child: const StartSection(),
              ),

              // LARGE DESKTOP
              largeDesktop: SizedBox(
                width: double.infinity,
                height: screenHeight,
                child: const StartSection(),
              ),
            ),
            const NeonSectionDivider(),
            AboutMeSmallSection(
              onAboutMePressed: widget.onAboutMePressed,
            ),
            const FeaturedWorkAndTechnologiesSection(),
            HomeCTASection(
              onContactPressed: () => context.go('/contact'),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
