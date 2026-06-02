import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';

class ProjectShowcaseSection extends StatelessWidget {
  final Project project;

  const ProjectShowcaseSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final images =
        project.gallery.isNotEmpty ? project.gallery : project.mockupPicture;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeaderText(
            context.l10n.projectShowcaseGallery,
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;

              final width = constraints.maxWidth;

              if (width > 1200) {
                crossAxisCount = 4;
              } else if (width > 800) {
                crossAxisCount = 3;
              } else if (width > 500) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 1;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 16 / 10,
                ),
                itemBuilder: (context, index) {
                  final imagePath = images[index];

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => _FullscreenImage(
                            imagePath: imagePath,
                            tag: imagePath,
                          ),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: imagePath,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FullscreenImage extends StatelessWidget {
  final String imagePath;
  final String tag;

  const _FullscreenImage({
    required this.imagePath,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Material(
        color: Colors.black.withOpacity(0.95),
        child: Center(
          child: Hero(
            tag: tag,
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 5,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
