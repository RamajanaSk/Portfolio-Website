import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';
import 'package:ramajana05/core/widgets/social_links_row.dart';
import 'package:ramajana05/features/contact/service/contact_email_service.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeaderText("CONTACT"),
              const SizedBox(height: 20),
              const Text(
                'Let’s build something great together.\nFeel free to reach out for collaborations or opportunities.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              const Row(
                children: [
                  Icon(Icons.email_outlined),
                  SizedBox(width: 10),
                  Text(
                    'ramajana1205@aol.com',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 10),
                  Text(
                    'Stuttgart, Germany',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const SocialLinksRow(),
              const SizedBox(height: 50),
              _ContactForm(
                nameController: nameController,
                emailController: emailController,
                messageController: messageController,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  await ContactEmailService.sendEmail(
                    name: nameController.text,
                    email: emailController.text,
                    message: messageController.text,
                  );

                  if (!context.mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Email client opened'),
                    ),
                  );
                },
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
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;

  const _ContactForm({
    required this.nameController,
    required this.emailController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: 'Your Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Your Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: messageController,
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
