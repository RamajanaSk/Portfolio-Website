import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectHeader extends StatelessWidget {
  final Project project;

  const ProjectHeader({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      height: isMobile ? 250 : 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              project.bannerPreviewPicture,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  size: 22,
                ),
                color: Colors.white,
                tooltip: "View on GitHub",
                onPressed: () async {
                  final url = Uri.parse(project.githubUrl);

                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    project.name.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 32 : 50,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Text(
                    project.catchPhrase,
                    maxLines: isMobile ? 3 : 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: isMobile ? 16 : 25,
                      height: 1.4,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        project.role,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      project.startDate.year.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 16 : 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
