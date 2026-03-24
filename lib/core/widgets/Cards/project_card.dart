import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String hexColor;
  final List<String> platformIcons;
  final String date;
  final String? githubUrl;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.hexColor,
    required this.platformIcons,
    required this.date,
    required this.onTap,
    this.githubUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
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
            // 🔥 LEFT COLOR BAR
            Container(
              width: 20,
              color: _hexToColor(hexColor),
            ),

            const SizedBox(width: 12),

            // 🔥 TEXT CONTENT
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.description(context),
                    ),

                    const Spacer(),

                    // 🔥 PLATFORM ICONS
                    Row(
                      children: platformIcons.asMap().entries.map((entry) {
                        final index = entry.key;
                        final icon = entry.value;

                        return Container(
                          margin: EdgeInsets.only(left: index == 0 ? 0 : 4),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: SvgPicture.asset(
                            _getIconPath(icon),
                            width: 16,
                            height: 16,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onSurface,
                              BlendMode.srcIn,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            // 🔥 IMAGE + OVERLAY
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.onSurface,
                    child: Center(
                      child: Text(
                        "IMAGE",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 🔥 GITHUB BUTTON
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: githubUrl != null ? () {} : null,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.code,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          // 🔥 DATE
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              date,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(color: Colors.black, blurRadius: 2)
                                ],
                              ),
                            ),
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

  // 🔧 Helpers

  Color _hexToColor(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String _getIconPath(String icon) {
    switch (icon.toLowerCase()) {
      case 'flutter':
        return 'assets/icons/flutter.svg';
      case 'dart':
        return 'assets/icons/dart.svg';
      case 'unity':
        return 'assets/icons/unity.svg';
      case 'osm':
        return 'assets/icons/map.svg';
      default:
        return 'assets/icons/code.svg';
    }
  }
}
