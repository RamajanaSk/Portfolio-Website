import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/Project.dart';
import 'package:ramajana05/features/projects/presentation/widget/about_content.dart';
import 'package:ramajana05/features/projects/presentation/widget/card/key_stats_card.dart';

class AboutProjectSection extends StatelessWidget {
  final Project project;

  const AboutProjectSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 850;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 70,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutContent(project: project),
                if (project.stats.isNotEmpty) ...[
                  const SizedBox(height: 40),
                  KeyStatsCard(project: project),
                ],
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AboutContent(
                    project: project,
                  ),
                ),
                if (project.stats.isNotEmpty) ...[
                  const SizedBox(width: 60),
                  SizedBox(
                    width: 270,
                    child: KeyStatsCard(
                      project: project,
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
