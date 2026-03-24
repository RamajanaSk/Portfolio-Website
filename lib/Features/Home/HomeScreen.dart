import 'package:flutter/material.dart';
import 'package:ramajana05/Core/widgets/Footer.dart';
import 'package:ramajana05/data/dummyData.dart';
import 'package:ramajana05/features/home/widgets/GetToKnowMeWidget.dart';

import 'package:ramajana05/features/home/widgets/Sections/skills_section.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.title});

  final String title;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _titleKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: const GetToKnowMeWidget(),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ABOUT ME",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "I’m a Flutter-focused developer with a strong interest in creating interactive and visually engaging applications. "
                      "My work combines clean architecture with creative UI/UX to build products that feel modern and intuitive.",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.6,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            SkillsSection(),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PROJECTS",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: dummyProjects.take(3).map((project) {
                        return SizedBox(
                          width: 300,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              key: _footerKey,
              child: Column(
                children: [
                  Footer(),
                  // Adding the SkillsSection here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Download CV"),
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple),
          ),
          SizedBox(width: 20),
          OutlinedButton(
            onPressed: () {},
            child: Text("View Portfolio ->"),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.purple,
                side: BorderSide(color: Colors.purple)),
          ),
        ],
      ),
    );
  }
}
