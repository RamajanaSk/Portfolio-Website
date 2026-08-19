import 'package:flutter/material.dart';
import 'package:ramajana05/Core/widgets/Cards/project_card.dart';

import 'package:ramajana05/data/models/Project.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/full_width_text.dart';
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
      filteredProjects = getDummyProjects(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const NeonSectionDivider(),
          FullWidthText(text: context.l10n.softwareProjects),
          const NeonSectionDivider(),
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
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProjects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getCrossAxisCount(context),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 2.0,
              ),
              itemBuilder: (context, index) {
                final project = filteredProjects[index];

                return ProjectCard(
                  title: project.name,
                  catchPhrase: project.catchPhrase,
                  hexColor: project.hexcolor,
                  previewImage: project.previewPicture,
                  platformLinks: project.platformLinks,
                  date: formatDate(project),
                  githubUrl: project.githubUrl,
                  onTap: () => widget.onProjectSelected(project),
                );
              },
            ),
          ),
          const NeonSectionDivider(),
          const Footer(),
        ],
      ),
    );
  }

  int getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width > 1200) return 3;
    if (width > 800) return 2;
    return 1;
  }

  String formatDate(Project project) {
    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return '${months[project.startDate.month - 1]} ${project.startDate.year}';
  }
}
