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
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.projects.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              final project = widget.projects[index];

              return Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  bottom: 20,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ProjectCard(
                    title: project.name,
                    catchPhrase: project.catchPhrase,
                    hexColor: project.hexcolor,
                    previewImage: project.previewPicture,
                    platformLinks: project.platformLinks,
                    date: "${project.startDate.year}",
                    githubUrl: project.githubUrl,
                    onTap: () => widget.onProjectTap(project),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
