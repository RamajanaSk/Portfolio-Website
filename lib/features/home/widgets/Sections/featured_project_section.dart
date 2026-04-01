import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';

class FeaturedProjectSection extends StatelessWidget {
  const FeaturedProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
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
          // 🔥 HEADER
          const SectionHeaderText("Featured Project"),

          const SizedBox(height: 32),

          // 🔥 MAIN CONTENT
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📸 IMAGE
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('images/traveler/traveler_main.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 40),

              // 🧠 TEXT SIDE
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Traveler",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "3D world generation from real-world OpenStreetMap data with live location tracking.",
                      style: TextStyle(
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Flutter • Unity • OpenStreetMap",
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // 🚀 CTA
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("View Case Study"),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // 🔽 SECOND CTA
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              child: const Text("View Projects"),
            ),
          ),
        ],
      ),
    );
  }
}
