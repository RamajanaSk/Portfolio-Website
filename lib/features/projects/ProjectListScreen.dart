import 'package:flutter/material.dart';

import 'package:ramajana05/Core/widgets/Cards/project_card.dart';
import 'package:ramajana05/core/utils/format_date.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/text/full_width_text.dart';
import 'package:ramajana05/data/dummyData.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_filter_searchbar.dart';

class ProjectListScreen extends StatefulWidget {
  final void Function(Project) onProjectSelected;

  const ProjectListScreen({
    super.key,
    required this.onProjectSelected,
  });

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  List<Project> filteredProjects = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (filteredProjects.isEmpty) {
      filteredProjects = getDummyProjects(context).cast<Project>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FullWidthText(
            text: context.l10n.softwareProjects,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ProjectFilterSearchBar(
              allProjects: getDummyProjects(context),
              onFilterChanged: (projects) {
                setState(() {
                  filteredProjects = projects;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildResponsiveProjectGrid(),
          ),
          const NeonSectionDivider(),
          const Footer(),
        ],
      ),
    );
  }

  Widget _buildResponsiveProjectGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final columns = _getCrossAxisCount(width);

        const spacing = 20.0;

        final totalSpacing = spacing * (columns - 1);

        final cardWidth = (width - totalSpacing) / columns;

        if (filteredProjects.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Text(
                'No projects found.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: filteredProjects.map((project) {
            return SizedBox(
              width: cardWidth,
              child: ProjectCard(
                title: project.name,
                catchPhrase: project.catchPhrase,
                hexColor: project.hexcolor,
                previewImage: project.previewPicture,
                platformLinks: project.platformLinks,
                date: AppDateFormatter.monthAndYear(
                  project.startDate,
                ),
                githubUrl: project.githubUrl,
                onTap: () {
                  widget.onProjectSelected(project);
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }

  int _getCrossAxisCount(double width) {
    if (width >= 1200) {
      return 3;
    }

    if (width >= 750) {
      return 2;
    }

    return 1;
  }
}
