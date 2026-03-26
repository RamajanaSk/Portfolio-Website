import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/features/Projects/widget/project_header.dart';

class Projectoverviewsection extends StatelessWidget {
  final Project project;

  const Projectoverviewsection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final mainColor = _hexToColor(project.hexcolor);

    return Scaffold(
      body: Row(
        children: [
          // 🔥 LEFT SIDE
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔥 PREVIEW
                  Expanded(
                      flex: 7, child: ProjectHeaderSection(project: project)),

                  const SizedBox(height: 24),

                  // 🔥 LOGO + MOCKUP
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        // 🔥 LOGO (mehr Breite)

                        // 🔥 MOCKUP (größer + natürlicher)
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              // 🔥 LOGO
                              Expanded(
                                flex: 1, // 🔥 größer gemacht
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: project.logoPicture.isNotEmpty
                                      ? Image.asset(
                                          project.logoPicture,
                                          fit: BoxFit.contain, // 🔥 wichtig!
                                        )
                                      : Container(color: Colors.black12),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // 🔥 MOCKUP (KEIN fixed 700px mehr)
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

                              // 🔥 INFO BOX (NEBEN dem Bild, nicht drüber)
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        project.typ.name.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Wrap(
                                        spacing: 6,
                                        runSpacing: 6,
                                        children: project.technologies
                                            .take(5)
                                            .map((tech) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              tech,
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 11,
                                              ),
                                            ),
                                          );
                                        }).toList(),
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
                ],
              ),
            ),
          ),

          // 🔥 RIGHT SIDE (BREITER)
          Padding(
            padding: const EdgeInsets.all(
                16), // 🔥 Abstand außen (oben, unten, rechts)
            child: Container(
              width: 400,
              height: double.infinity,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(15), // 🔥 runde Ecken
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(32), // 🔥 innen (für Text)
                  child: Text(
                    project.startDate.year.toString(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
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
