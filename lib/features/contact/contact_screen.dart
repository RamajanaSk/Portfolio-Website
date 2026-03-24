import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/social_links_row.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔥 TITLE
              Text(
                'CONTACT',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 4,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),

              const SizedBox(height: 20),

              // ✨ SUBTEXT
              const Text(
                'Let’s build something great together.\nFeel free to reach out for collaborations or opportunities.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              // 📧 EMAIL
              Row(
                children: const [
                  Icon(Icons.email_outlined),
                  SizedBox(width: 10),
                  Text(
                    'ramajana05@gmail.com',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 📍 LOCATION
              Row(
                children: const [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 10),
                  Text(
                    'Stuttgart, Germany',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // 🔗 SOCIALS
              const SocialLinksRow(),

              const SizedBox(height: 50),

              // 🧾 CONTACT FORM
              _ContactForm(),

              const SizedBox(height: 40),

              // 🚀 CTA BUTTON
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  backgroundColor:
                      isDark ? const Color(0xFFFF2D95) : Colors.black,
                ),
                child: const Text(
                  'Send Message',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactForm extends StatelessWidget {
  const _ContactForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Your Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          decoration: InputDecoration(
            hintText: 'Your Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Your Message',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
