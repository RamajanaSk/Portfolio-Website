import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinksRow extends StatelessWidget {
  const SocialLinksRow({super.key});

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildIcon({
    required IconData icon,
    required String url,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () => _openLink(url),
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            size: 26,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(
          icon: FontAwesomeIcons.github,
          url: "https://github.com/yourusername",
          tooltip: "GitHub",
        ),
        _buildIcon(
          icon: FontAwesomeIcons.linkedin,
          url: "https://linkedin.com/in/yourusername",
          tooltip: "LinkedIn",
        ),
        _buildIcon(
          icon: FontAwesomeIcons.twitter,
          url: "https://twitter.com/yourusername",
          tooltip: "Twitter",
        ),
        _buildIcon(
          icon: FontAwesomeIcons.twitch,
          url: "https://twitch.tv/ramajana05",
          tooltip: "Twitch",
        ),
        _buildIcon(
          icon: FontAwesomeIcons.instagram,
          url: "https://instagram.com/yourusername",
          tooltip: "Instagram",
        ),
      ],
    );
  }
}
