import 'package:flutter/material.dart';
import 'package:ramajana05/Data/dummyData.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/Screens/ProjectDetailScreen.dart';

class ProjectListScreen extends StatelessWidget {
  final void Function(Project) onProjectSelected;

  const ProjectListScreen({
    super.key,
    required this.onProjectSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 TITLE + FILTER
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'SOFTWARE PROJECTS',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                PopupMenuButton<String>(
                  onSelected: (value) => print('Selected: $value'),
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'Option 1', child: Text('Option 1')),
                    PopupMenuItem(value: 'Option 2', child: Text('Option 2')),
                    PopupMenuItem(value: 'Option 3', child: Text('Option 3')),
                  ],
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Filter',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 🔥 GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: dummyProjects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getCrossAxisCount(context), // responsive
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 2.0,
              ),
              itemBuilder: (context, index) {
                final project = dummyProjects[index];

                return ProjectCard(
                  project: project,
                  onTap: () => onProjectSelected(project),
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
}

// 🔥 PROJECT CARD (CLEAN COMPONENT)
class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // LEFT COLOR BAR
            Container(
              width: 20,
              color: hexToColor(project.hexcolor),
            ),

            const SizedBox(width: 12),

            // TEXT
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.shortDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: const [
                        Icon(Icons.favorite, color: Colors.pink, size: 20),
                        SizedBox(width: 8),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 8),
                        Icon(Icons.share, color: Colors.blue, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            // IMAGE AREA
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Text(
                        "IMAGE",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(
                            alignment: Alignment.topRight,
                            child:
                                Icon(Icons.star, size: 24, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Row(
                                children: [
                                  Icon(Icons.favorite,
                                      color: Colors.white, size: 20),
                                  SizedBox(width: 6),
                                  Icon(Icons.access_time,
                                      color: Colors.white, size: 20),
                                ],
                              ),
                              Text(
                                "2024",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(color: Colors.black, blurRadius: 4)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
