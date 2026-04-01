import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/me_cv.png',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 40),

            // 📝 TEXT + INFO
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MOBILE DEVELOPER",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "I’m a Fullstack Developer with a focus on mobile applications and interactive experiences. "
                    "I have worked in agile customer projects, building frontend solutions and designing database structures. "
                    "Through my experience as a tutor, I’ve developed strong problem-solving and communication skills.",
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.6,
                      color: textColor.withOpacity(0.8),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 INFO ROW
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: [
                      _infoItem(Icons.location_on, "Stuttgart"),
                      _infoItem(Icons.cake, "12.05.2000"),
                      _infoItem(Icons.flag, "German"),
                      _infoItem(Icons.directions_car, "Driver’s License B"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 🔹 SMALL INFO ITEM
  Widget _infoItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
