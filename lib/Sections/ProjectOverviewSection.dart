import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';

class Projectoverviewsection extends StatelessWidget {
  final Project project;

  const Projectoverviewsection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Dynamic square size (never causes overflow)
    //final double square = screenWidth * 0.3;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // LEFT SIDE
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  // 🖤 CLEAN BLACK BOX — automatic height control
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.name.toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Text(
                              project.shortDescription,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // LOGO + MOCKUP
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        // Logo square
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 1, 1),
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Mockup also stays same height as logo
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1, // same square height
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 68, 2, 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // RIGHT SIDE PURPLE — automatically sizes itself
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF9C4DFF),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "BACHELOR THESIS",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "ABOUT THIS PROJECT",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: const [
                        Icon(
                          Icons.edit_document,
                          size: 39,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.code,
                          size: 39,
                        ),
                        Spacer(),
                        Text(
                          "2024",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
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
    );
  }
}
