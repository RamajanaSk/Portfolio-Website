import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/widgets/cards/project_card.dart';
import 'package:ramajana05/core/widgets/footer.dart';
import 'package:ramajana05/core/widgets/neon_background_secetion.dart';
import 'package:ramajana05/features/about/presentation/widget/componets/build_tech_category.dart';
import 'package:ramajana05/features/about/presentation/widget/sections/about_me_section.dart';
import 'package:ramajana05/features/about/presentation/widget/sections/education_section.dart';
import 'package:ramajana05/features/about/presentation/widget/sections/experience_section.dart';
import 'package:ramajana05/Data/dummyData.dart';

class AboutMeScreen extends StatelessWidget {
  final String githubURL = 'https://github.com/yourusername';
  final String linkedInURL = 'https://linkedin.com/in/yourusername';

  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recentProjects = [...dummyProjects]
      ..sort((a, b) => b.startDate.compareTo(a.startDate));

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 60),

          // 🔥 HERO / TITLE
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "ABOUT",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: AboutMeSection(),
          ),

          const SizedBox(height: 60),

          // 🔥 EXPERIENCE + EDUCATION
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: ExperienceSection()),
                  SizedBox(width: 80),
                  Expanded(child: EducationSection()),
                ],
              ),
            ),
          ),

          const SizedBox(height: 80),

          const SizedBox(height: 80),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: TechStackSection(),
          ),

          const SizedBox(height: 80),

          // 🔥 PROJECTS SECTION
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "RECENT PROJECTS",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (context, index) {
                final project = recentProjects[index];

                return ProjectCard(
                  title: project.name,
                  description: project.shortDescription,
                  hexColor: project.hexcolor,
                  previewImage: project.previewPicture,
                  platformLinks: project.platformLinks,
                  date: "${project.startDate.year}",
                  githubUrl: project.githubUrl,
                  onTap: () => _onProjectTap(context, project),
                );
              },
            ),
          ),

          const SizedBox(height: 80),

          // 🔥 CTA SECTION
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "Let’s build something meaningful.",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 60),

          const SizedBox(height: 80),

          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CREATIVE WORK",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Twitch – Live Content & Community",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  "I stream games like Valorant and experiment with interactive formats and community-driven content.",
                ),
                const SizedBox(height: 20),
                const Text(
                  "Music Production",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  "I create techno-style tracks focusing on rhythm, energy, and sound design.",
                ),
              ],
            ),
          ),
          const NeonGradientSection(),
          const Footer(),
        ],
      ),
    );
  }

  void _onProjectTap(BuildContext context, Project project) {
    print(project.name);
  }
}
