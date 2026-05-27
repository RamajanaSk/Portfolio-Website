import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/background/neon_gradient_background.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ramajana05/core/widgets/social_links_row.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _openEmail() async {
    final uri = Uri.parse('mailto:ramajana1205@aol.com');
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "RAMAJANA",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Creative Developer focused on Flutter, mobile apps and interactive experiences.",
                      style: TextStyle(
                        color: textColor.withOpacity(0.7),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Navigation",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: textColor)),
                    const SizedBox(height: 10),
                    _navItem("Home"),
                    _navItem("About"),
                    _navItem("Projects"),
                    _navItem("Contact"),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: textColor)),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: _openEmail,
                      child: Text(
                        'ramajana1205@aol.com',
                        style: TextStyle(
                          color: textColor.withOpacity(0.8),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Stuttgart, Germany",
                      style: TextStyle(color: textColor.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const SocialLinksRow(),
          const SizedBox(height: 30),
          Text(
            '© 2026 RAMAJANA SKOPLJAK — BUILT WITH FLUTTER',
            style: TextStyle(
              color: textColor.withOpacity(0.6),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
