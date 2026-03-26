import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ramajana05/Core/widgets/Footer.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/full_width_text.dart';
import 'package:ramajana05/core/widgets/neon_background_secetion.dart';
import 'package:ramajana05/data/dummyData.dart';
import 'package:ramajana05/features/home/widgets/start_header_text.dart';

import 'package:ramajana05/features/home/widgets/start_section.dart';

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
              child: const StartSection(),
            ),
            const NeonGradientSection(),
            FullWidthText(
                text:
                    "I love building things that are not just functional, but feel good to use."),
            Text("Flutter • Unity • OpenStreetMap"),
            const NeonGradientSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stat("2.5+", "Years"),
                Stat("10+", "Projects"),
                Stat("Flutter", "Focus"),
              ],
            ),
            Text("WHAT I BUILD", style: TextStyle()),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    color: Colors.grey.shade900,
                    child: const Center(child: Text("Project Image")),
                  ),
                ),
                const SizedBox(width: 40),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Traveler",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Text(
                        "3D world generation from real-world OpenStreetMap data with live location tracking."),
                    SizedBox(height: 12),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: null,
                      child: Text("View Case Study"),
                    )
                  ],
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _badge("Flutter"),
                _badge("Dart"),
                _badge("Unity"),
                _badge("Kotlin"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AnimatedStat(value: 3, label: "Years Experience"),
                AnimatedStat(value: 10, label: "Projects Built"),
                AnimatedStat(value: 1, label: "Thesis Grade"),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const AnimatedStat(value: 10, label: "Projects"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 60),
              height: 1,
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                InfoCard("Clean Code", "Readable, scalable architecture"),
                InfoCard("UX First", "Focus on user experience"),
                InfoCard("Real-world Systems", "Maps, data, interaction"),
              ],
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
            _buildButtons(),
            ElevatedButton(onPressed: () {}, child: Text("View Projects")),
            const NeonGradientSection(),
            FullWidthText(
                text:
                    "I love building things that are not just functional, but feel good to use."),

            const NeonGradientSection(),
            Footer(),
            // Adding the SkillsSection here
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
                backgroundColor: const Color.fromARGB(255, 217, 0, 255)),
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

class Stat extends StatelessWidget {
  final String value;
  final String label;

  const Stat(this.value, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: color.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

class CreativeCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const CreativeCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(subtitle),
        ],
      ),
    );
  }
}

class AnimatedStat extends StatefulWidget {
  final int value;
  final String label;

  const AnimatedStat({super.key, required this.value, required this.label});

  @override
  State<AnimatedStat> createState() => _AnimatedStatState();
}

class _AnimatedStatState extends State<AnimatedStat> {
  int display = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      for (int i = 0; i <= widget.value; i++) {
        Future.delayed(Duration(milliseconds: i * 30), () {
          if (mounted) setState(() => display = i);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$display+",
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Text(widget.label),
      ],
    );
  }
}

Widget _badge(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
    ),
    child: Text(text),
  );
}

class InfoCard extends StatefulWidget {
  final String title;
  final String description;

  const InfoCard(this.title, this.description, {super.key});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHovered ? 0.12 : 0.05),
              blurRadius: isHovered ? 20 : 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        transform: Matrix4.identity()..scale(isHovered ? 1.03 : 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 TITLE
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 DESCRIPTION
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 14,
                color: color.withOpacity(0.7),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
