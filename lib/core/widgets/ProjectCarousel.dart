import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ramajana05/Core/widgets/Cards/project_card.dart';

import 'package:ramajana05/Data/Models/Project.dart';

class ProjectCarousel extends StatefulWidget {
  final List<Project> projects;
  final void Function(Project) onProjectTap;

  const ProjectCarousel({
    super.key,
    required this.projects,
    required this.onProjectTap,
  });

  @override
  State<ProjectCarousel> createState() => _ProjectCarouselState();
}

class _ProjectCarouselState extends State<ProjectCarousel> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted) return;

      int nextPage = (currentIndex + 1) % widget.projects.length;

      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void goToPage(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔥 PAGEVIEW
        PageView.builder(
          controller: _controller,
          itemCount: widget.projects.length,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          itemBuilder: (context, index) {
            final project = widget.projects[index];

            return Padding(
              padding: const EdgeInsets.all(8),
              child: ProjectCard(
                title: project.name,
                description: project.shortDescription,
                hexColor: project.hexcolor,
                platformIcons: project.platformIcons,
                date: "${project.startDate.year}",
                githubUrl: project.githubUrl,
                onTap: () => widget.onProjectTap(project),
              ),
            );
          },
        ),

        // 🔥 LEFT ARROW
        Positioned(
          left: 8,
          top: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                int prev = (currentIndex - 1) < 0
                    ? widget.projects.length - 1
                    : currentIndex - 1;
                goToPage(prev);
              },
            ),
          ),
        ),

        // 🔥 RIGHT ARROW
        Positioned(
          right: 8,
          top: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                int next = (currentIndex + 1) % widget.projects.length;
                goToPage(next);
              },
            ),
          ),
        ),

        // 🔥 DOTS INDICATOR
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.projects.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentIndex == index ? 12 : 8,
                height: currentIndex == index ? 12 : 8,
                decoration: BoxDecoration(
                  color:
                      currentIndex == index ? Colors.black : Colors.grey[400],
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
