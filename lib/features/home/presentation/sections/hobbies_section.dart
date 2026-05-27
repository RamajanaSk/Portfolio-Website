import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class HobbiesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Hobbies',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 10),
          HobbyCard(hobbyName: 'Drawing', hobbyIcon: Icons.brush),
          const SizedBox(height: 10),
          HobbyCard(hobbyName: 'Gym', hobbyIcon: Icons.fitness_center),
          const SizedBox(height: 10),
          TwitchStreamCard(),
        ],
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String hobbyName;
  final IconData hobbyIcon;

  HobbyCard({required this.hobbyName, required this.hobbyIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(hobbyIcon, size: 40, color: Colors.white70),
        SizedBox(width: 20),
        Text(hobbyName, style: TextStyle(fontSize: 18, color: Colors.white)),
      ],
    );
  }
}

class TwitchStreamCard extends StatefulWidget {
  @override
  _TwitchStreamCardState createState() => _TwitchStreamCardState();
}

class _TwitchStreamCardState extends State<TwitchStreamCard> {
  final String twitchUsername = 'Ramajana05';
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to full screen WebView or external browser
        _controller.loadUrl('https://twitch.tv/$twitchUsername');
      },
      child: Column(
        children: [
          SizedBox(
            height: 200, // Set height for the preview
            child: WebView(
              initialUrl:
                  'https://player.twitch.tv/?channel=$twitchUsername&parent=yourappdomain.com&muted=true', // replace 'yourappdomain.com' with your app's domain
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
              },
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
              },
            ),
          ),
          Text('Watch live on Twitch!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
