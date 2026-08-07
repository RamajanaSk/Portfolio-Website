import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/phone/phone_mockup.dart';
import 'package:ramajana05/features/projects/presentation/widget/experience_text.dart';

class ExperienceSection extends StatelessWidget {
  final bool isMobile;

  const ExperienceSection({
    super.key,
    required this.isMobile,
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
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhoneMockup(
                    imagePath: 'assets/images/traveler/buildings.png',
                    phoneWidth: 450,
                    phoneHeight: 920,
                    visibleHeight: 650,
                  ),
                  SizedBox(height: 50),
                  ExperienceText(),
                  SizedBox(height: 50),
                ],
              )
            : const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 4,
                      child: PhoneMockup(
                        imagePath: 'assets/images/traveler/buildings.png',
                        phoneWidth: 450,
                        phoneHeight: 920,
                        visibleHeight: 650,
                      )),
                  SizedBox(width: 90),
                  Expanded(
                    flex: 5,
                    child: ExperienceText(),
                  ),
                ],
              ),
      ),
    );
  }
}
