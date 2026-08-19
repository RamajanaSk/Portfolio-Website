import 'package:flutter/material.dart';

import 'package:ramajana05/core/widgets/phone/phone_mockup.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/features/projects/presentation/widget/text/solution_text.dart';

class SolutionSection extends StatelessWidget {
  final bool isMobile;
  final Project project;

  const SolutionSection({
    super.key,
    required this.isMobile,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        isMobile ? 24 : 64,
        isMobile ? 50 : 80,
        isMobile ? 24 : 64,
        0,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhoneMockup(
                    imagePath: project.solutionImage,
                  ),
                  const SizedBox(height: 50),
                  SolutionText(
                    title: project.solutionTitle,
                    description: project.solution,
                    color: _parseHexColor(project.hexcolor),
                  ),
                  const SizedBox(height: 50),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: PhoneMockup(
                      imagePath: project.solutionImage,
                    ),
                  ),
                  const SizedBox(width: 90),
                  Expanded(
                    flex: 5,
                    child: SolutionText(
                      title: project.solutionTitle,
                      description: project.solution,
                      color: _parseHexColor(project.hexcolor),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Color _parseHexColor(String hex) {
    final cleaned = hex.replaceFirst('#', '');

    return Color(
      int.parse(
        cleaned.length == 6 ? 'FF$cleaned' : cleaned,
        radix: 16,
      ),
    );
  }
}
