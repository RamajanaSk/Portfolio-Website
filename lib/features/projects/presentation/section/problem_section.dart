import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/image/project_image.dart';
import 'package:ramajana05/core/widgets/section_label.dart';

class ProblemSection extends StatelessWidget {
  final bool isMobile;

  const ProblemSection({
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: isMobile ? 50 : 80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: isMobile
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProblemText(),
                  SizedBox(height: 40),
                  ProjectImage(
                    imagePath: 'assets/images/traveler/map.png',
                  )
                ],
              )
            : const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: _ProblemText(),
                  ),
                  SizedBox(width: 70),
                  Expanded(
                      flex: 5,
                      child: ProjectImage(
                        imagePath: 'assets/images/traveler/map.png',
                      )),
                ],
              ),
      ),
    );
  }
}

class _ProblemText extends StatelessWidget {
  const _ProblemText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          text: 'THE PROBLEM',
          color: Color.fromARGB(255, 30, 0, 255),
        ),
        SizedBox(height: 20),
        Text(
          "We walk through cities\n"
          "without noticing what's\n"
          "around us.",
          style: TextStyle(
            fontSize: 42,
            height: 1.15,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.2,
          ),
        ),
        SizedBox(height: 28),
        Text(
          "Traveler changes that. It turns real world\n"
          "exploration into a fun, rewarding adventure.",
          style: TextStyle(
            fontSize: 17,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}
