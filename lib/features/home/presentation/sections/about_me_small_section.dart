import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/buttons/outline_button.dart';
import 'package:ramajana05/core/widgets/info_chip.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';

class AboutMeSmallSection extends StatelessWidget {
  final VoidCallback onAboutMePressed;

  const AboutMeSmallSection({
    super.key,
    required this.onAboutMePressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 40,
        bottom: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImage(),
                    const SizedBox(height: 30),
                    _buildText(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImage(),
                    const SizedBox(width: 60),
                    Expanded(child: _buildText()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ABOUT ME",
          style: TextStyle(
            fontSize: 40,
            height: 1.5,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 5,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          "I am a developer with a focus on cross-platform mobile applications, combining clean and responsive UI design with scalable architecture and interactive experiences. My background includes Flutter development, fullstack systems and creative technologies such as Unity and VR, allowing me to approach projects from both a technical and creative perspective.",
          style: TextStyle(
            fontSize: 20,
            height: 1.9,
            color: Colors.white.withOpacity(0.72),
          ),
        ),
        const SizedBox(height: 20),
        const Wrap(
          spacing: 18,
          runSpacing: 18,
          children: [
            InfoChip("Mobile Computing"),
            InfoChip("UI / UX Focused"),
            InfoChip("Flutter Developer"),
            InfoChip("Cross Platform"),
          ],
        ),

        //Row(
        //mainAxisSize: MainAxisSize.min,
        //children: [
        //NeonOutlineButton(
        //text: "Learn more about me",
        //onPressed: onAboutMePressed,
        //),
        //],
        // ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      width: 400,
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage("assets/me_cv.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
