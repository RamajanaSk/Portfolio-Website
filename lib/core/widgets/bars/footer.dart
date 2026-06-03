import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
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
                    Text("RAMAJANA",
                        style: AppTextStyles.footerTitleText(context)),
                    const SizedBox(height: 10),
                    Text(context.l10n.footerDescription,
                        style: AppTextStyles.footerText(context)),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.l10n.navigation,
                        style: AppTextStyles.footerTitleText(context)),
                    const SizedBox(height: 10),
                    _navItem(context, context.l10n.home),
                    _navItem(context, context.l10n.about),
                    _navItem(context, context.l10n.projects),
                    _navItem(context, context.l10n.contact),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.l10n.contact,
                        style: AppTextStyles.footerTitleText(context)),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: _openEmail,
                      child: Text('ramajana1205@aol.com',
                          style: AppTextStyles.footerText(context)),
                    ),
                    const SizedBox(height: 8),
                    Text(context.l10n.location,
                        style: AppTextStyles.footerText(context)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const SocialLinksRow(),
          const SizedBox(height: 30),
          Text(
            '© 2026 RAMAJANA SKOPLJAK — ${context.l10n.builtWithFlutter}',
            style: AppTextStyles.footerText(context),
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 6,
      ),
      child: Text(
        title,
        style: AppTextStyles.footerText(context),
      ),
    );
  }
}
