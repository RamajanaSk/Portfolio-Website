import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ramajana05/Core/theme/appColors.dart';
import '../Widgets/StartScreenWidgetParts/LeftSideWidget.dart';
import '../Widgets/StartScreenWidgetParts/RightSideWidget.dart';

class Landingwidget extends StatelessWidget {
  const Landingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30), // Outer padding
      child: Column(
        children: [
          // OBERER BEREICH (ca. 75%)
          Expanded(
            flex: 4,
            child: Row(
              children: [
                // Linke Seite mit 2 Containern
                SizedBox(
                  width: screenWidth * 0.3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(child: Text("Links oben")),
                        ),
                      ),
                      const SizedBox(height: 12), // Abstand
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(child: Text("Links unten")),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12), // Abstand zwischen links & rechts
                // Rechte Seite
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(child: Text("Rechts groß")),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16), // Abstand zwischen Bereichen

          // UNTERER BEREICH (ca. 25%)
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "RAMAJANA",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 6), // kleiner Abstand
                          Text(
                            "CREATIVE DEVELOPER",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // ---------------LOGO-----------------
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/Ramajana05Logo.png",
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
