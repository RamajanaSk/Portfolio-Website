import 'package:flutter/material.dart';
import 'package:ramajana05/Core/widgets/Cards/project_card.dart';
import 'package:ramajana05/Data/dummyData.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramajana05/Features/Projects/ProjectFilterBar.dart';

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
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              children: [
                const Text(
                  'SOFTWARE PROJECTS',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: ProjectFilterBar(
              allProjects: dummyProjects,
              onFilterChanged: (projects) {
                setState(() {
                  filteredProjects = projects;
                });
              },
            ),
          ),

          // 🔥 GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
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
                  platformIcons: project.platformIcons,
                  date: formatDate(project),
                  githubUrl: project.githubUrl,
                  onTap: () => widget.onProjectSelected(project),
                );
              },
            ),
          ),
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
