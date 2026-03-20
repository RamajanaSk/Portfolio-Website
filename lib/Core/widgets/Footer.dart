import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900], // Dark footer background for contrast
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildSocialIcon(
                  icon: Icons.home, url: 'https://yourwebsite.com'),
              _buildSocialIcon(
                  icon: Icons.mail, url: 'mailto:your.email@example.com'),
              _buildSocialIcon(icon: Icons.phone, url: 'tel:+1234567890'),
              _buildSocialIcon(
                  icon: Icons.facebook,
                  url: 'https://facebook.com/yourprofile'),
              _buildSocialIcon(
                  icon: Icons.safety_check,
                  url: 'https://linkedin.com/in/yourprofile'),
              _buildSocialIcon(
                  icon: Icons.abc, url: 'https://twitter.com/yourhandle'),
              _buildSocialIcon(
                  icon: Icons.abc, url: 'https://instagram.com/yourhandle'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '© 2025 RAMAJANA SKOPLJAK. ALL RIGHT RESERVED.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({required IconData icon, required String url}) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }

  void _launchURL(String url) async {
    if (!await canLaunch(url)) {
      throw 'Could not launch $url';
    }
    await launch(url);
  }
}
