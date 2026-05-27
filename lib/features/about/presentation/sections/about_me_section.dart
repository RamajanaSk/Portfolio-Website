import 'package:flutter/material.dart';
import 'package:ramajana05/core/utils/file_downloader.dart';
import 'package:ramajana05/core/widgets/info_chip.dart';
import 'package:ramajana05/core/widgets/minimal_action.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "me_cv.png",
              width: 340,
              height: 440,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(width: 100),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 760,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 36),
                  const Text(
                    "MOBILE DEVELOPER",
                    style: TextStyle(
                      fontSize: 58,
                      height: 1.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "I build modern mobile applications with a focus on clean UI, immersive experiences and scalable architecture. My background combines Flutter, Fullstack Development and creative technologies such as Unity and VR.",
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.9,
                      color: Colors.white.withOpacity(0.72),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Wrap(
                    spacing: 18,
                    runSpacing: 18,
                    children: [
                      InfoChip("Flutter Developer"),
                      InfoChip("Unity & VR"),
                      InfoChip("Fullstack Experience"),
                      InfoChip("Based in Stuttgart"),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Wrap(
                        spacing: 34,
                        runSpacing: 20,
                        children: [
                          MinimalAction(
                            icon: Icons.download_rounded,
                            text: "Download CV",
                            onTap: () {
                              FileDownloader.downloadAsset(
                                assetPath: 'pdfs/cv.pdf',
                                fileName: 'Ramajana_Skopljak_CV.pdf',
                              );
                              //FileDownloader.openAsset(
                              //assetPath: 'pdfs/cv.pdf',
                              //);
                            },
                          ),
                          MinimalAction(
                            icon: Icons.arrow_outward_rounded,
                            text: "Explore Projects",
                            onTap: () {
                              FileDownloader.openAsset(
                                assetPath: 'pdfs/software_portfolio.pdf',
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
