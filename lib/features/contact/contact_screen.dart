import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/widgets/bars/footer.dart';
import 'package:ramajana05/core/widgets/buttons/neon_outline_button.dart';
import 'package:ramajana05/core/widgets/divider/neon_section_divider.dart';
import 'package:ramajana05/core/widgets/social_links_row.dart';
import 'package:ramajana05/core/widgets/text/background_section_text.dart';
import 'package:ramajana05/core/widgets/text/eyebrow_text.dart';
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

  Future<void> _sendMessage() async {
    await ContactEmailService.sendEmail(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      message: messageController.text.trim(),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email client opened'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 850;

    return SingleChildScrollView(
      child: Column(
        children: [
          _ContactSection(
            isMobile: isMobile,
            nameController: nameController,
            emailController: emailController,
            messageController: messageController,
            onSend: _sendMessage,
          ),
          const NeonSectionDivider(),
          const Footer(),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  final bool isMobile;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final VoidCallback onSend;

  const _ContactSection({
    required this.isMobile,
    required this.nameController,
    required this.emailController,
    required this.messageController,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height,
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          BackgroundSectionText(
            text: context.l10n.contact.toUpperCase(),
            isMobile: isMobile,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 70 : 100,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1250,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EyebrowText(
                      number: '04',
                      text: context.l10n.getInTouch.toUpperCase(),
                    ),
                    SizedBox(height: isMobile ? 45 : 65),
                    if (isMobile)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _ContactInformation(),
                          const SizedBox(height: 55),
                          _ContactFormCard(
                            nameController: nameController,
                            emailController: emailController,
                            messageController: messageController,
                            onSend: onSend,
                          ),
                        ],
                      )
                    else
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 5,
                            child: _ContactInformation(),
                          ),
                          const SizedBox(width: 90),
                          Expanded(
                            flex: 5,
                            child: _ContactFormCard(
                              nameController: nameController,
                              emailController: emailController,
                              messageController: messageController,
                              onSend: onSend,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInformation extends StatelessWidget {
  const _ContactInformation();

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;
    final isMobile = MediaQuery.sizeOf(context).width < 850;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.letsBuild.toUpperCase(),
          style: TextStyle(
            fontSize: isMobile ? 42 : 62,
            height: .95,
            fontWeight: FontWeight.w900,
            letterSpacing: -2,
          ),
        ),
        const SizedBox(height: 6),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                Color(0xFFFF2D95),
                Color(0xFF8A2BE2),
                Color(0xFF00CFFF),
              ],
            ).createShader(bounds);
          },
          child: Text(
            context.l10n.something.toUpperCase(),
            style: TextStyle(
              fontSize: isMobile ? 42 : 62,
              height: .95,
              fontWeight: FontWeight.w900,
              letterSpacing: -2,
            ),
          ),
        ),
        const SizedBox(height: 30),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 480,
          ),
          child: Text(
            context.l10n.letsBuildSomethingGreat,
            style: TextStyle(
              color: foreground.withValues(alpha: .48),
              fontSize: 16,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 50),
        const _ContactItem(
          icon: Icons.email_outlined,
          label: 'EMAIL',
          value: 'ramajana1205@aol.com',
        ),
        const SizedBox(height: 24),
        _ContactItem(
            icon: Icons.location_on_outlined,
            label: context.l10n.location.toUpperCase(),
            value: context.l10n.stuttgartGermany),
        const SizedBox(height: 40),
        Container(
          width: 50,
          height: 1,
          color: foreground.withValues(alpha: .1),
        ),
        const SizedBox(height: 30),
        const SocialLinksRow(),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: foreground.withValues(alpha: .04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: foreground.withValues(alpha: .08),
            ),
          ),
          child: Icon(
            icon,
            size: 18,
            color: foreground.withValues(alpha: .65),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: foreground.withValues(alpha: .28),
                fontSize: 9,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: foreground.withValues(alpha: .85),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactFormCard extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final VoidCallback onSend;

  const _ContactFormCard({
    required this.nameController,
    required this.emailController,
    required this.messageController,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(),
        boxShadow: [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.sendMessage.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.asSoonAsICan,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 32),
          _ContactField(
            controller: nameController,
            label: 'NAME',
            hint: context.l10n.yourName,
          ),
          const SizedBox(height: 20),
          _ContactField(
            controller: emailController,
            label: 'EMAIL',
            hint: context.l10n.yourEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          _ContactField(
            controller: messageController,
            label: context.l10n.message.toUpperCase(),
            hint: context.l10n.yourMessage,
            maxLines: 5,
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerRight,
            child: NeonOutlineButton(
              text: context.l10n.sendMessage,
              onPressed: onSend,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final int maxLines;
  final TextInputType? keyboardType;

  const _ContactField({
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 9),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: TextStyle(
            color: foreground.withValues(alpha: .9),
            fontSize: 14,
          ),
          cursorColor: const Color(0xFFFF2D95),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: foreground.withValues(alpha: .25),
              fontSize: 14,
            ),
            filled: true,
            fillColor: foreground.withValues(alpha: .025),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18,
              vertical: maxLines > 1 ? 18 : 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: foreground.withValues(alpha: .08),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFFFF2D95),
                width: 1.2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
