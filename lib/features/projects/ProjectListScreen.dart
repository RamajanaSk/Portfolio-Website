import 'package:flutter/material.dart';
import 'package:ramajana05/Core/widgets/Cards/project_card.dart';
import 'package:ramajana05/Data/dummyData.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/widgets/footer.dart';
import 'package:ramajana05/core/widgets/neon_background_secetion.dart';
import 'package:ramajana05/features/projects/section/project_showcase_section.dart';
import 'package:ramajana05/features/projects/widget/project_filter_searchbar.dart';

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
  List<Project> filteredProjects = dummyProjects;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // 🔹 TITLE
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              children: [
                Text(
                  'SOFTWARE PROJECTS',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),

          // 🔹 FILTER
          Padding(
            padding: const EdgeInsets.all(20),
            child: ProjectFilterSearchBar(
              allProjects: dummyProjects,
              onFilterChanged: (projects) {
                setState(() {
                  filteredProjects = projects;
                });
              },
            ),
          ),

          // 🔥 GRID (part of scroll now)
          Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              shrinkWrap: true, // ✅ required
              physics: const NeverScrollableScrollPhysics(), // ✅ required
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
                  description: project.shortDescription,
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

          // 🔥 EXTRA SECTIONS (NOW SCROLLABLE)
          const NeonGradientSection(),
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
