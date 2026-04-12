import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_color_year_card.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_header.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_info_card.dart';

class Projectoverviewsection extends StatelessWidget {
  final Project project;

  const Projectoverviewsection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final mainColor = _hexToColor(project.hexcolor);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ProjectHeaderSection(project: project),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: project.logoPicture.isNotEmpty
                                  ? Image.asset(
                                      project.logoPicture,
                                      fit: BoxFit.contain,
                                    )
                                  : Container(color: Colors.black12),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: project.mockupPicture.isNotEmpty
                                  ? Image.asset(
                                      project.previewPicture,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(color: Colors.black12),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 3,
                            child: ProjectInfoCard(
                              technologies: project.technologies.join(", "),
                              description: project.shortDescription,
                              role: project.role,
                              outcome: "",
                              startDate: project.startDate,
                              endDate: project.endDate,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }

  Color _hexToColor(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
