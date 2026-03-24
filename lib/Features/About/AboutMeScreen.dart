import 'package:flutter/material.dart';
import 'package:ramajana05/features/Home/widgets/Sections/hobbies_section.dart';
import 'package:ramajana05/features/Home/widgets/Sections/skills_section.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeScreen extends StatelessWidget {
  final String githubURL = 'https://github.com/yourusername';
  final String linkedInURL = 'https://linkedin.com/in/yourusername';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      body: ListView(
        children: <Widget>[
          buildTopSection(),
          buildAboutMeSection(),
          buildHobbySection(),
          HobbiesSection(),
          SkillsSection(),
          buildGallerySection(),
          buildProjectsSection(),
          buildTextSection(),
          buildContactForm(),
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildTopSection() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 28, 1, 232),
        image: DecorationImage(
          image: NetworkImage("https://example.com/your-image.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
        ),
      ),
      child: Center(
        child: Text(
          'Ramajana',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildAboutMeSection() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('About Me',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255))),
          SizedBox(height: 10),
          Text(
            "I'm Ramajana, a 24-year-old computer science graduate passionate about leveraging technology to craft creative solutions and drive positive change. Having completed my bachelor’s degree in 2025, my academic and personal journey has been deeply influenced by the power of innovative thinking and the endless possibilities that computer science offers."
            "Why computer science? For me, it represents one of the most vibrant fields where creativity meets utility. I thrive on solving problems logically and envisage a world where technology continually improves our way of life. This vision was the cornerstone of my thesis, which centered around developing an app designed to address pressing issues in today's society."
            "I am driven by the belief that I am part of something larger than myself, and I aim to imbue every project with a piece of my essence. My philosophy on work and life is not just to exist, but to contribute meaningfully, ensuring that my actions create lasting impacts. I am not here just to live; I am here to make life better, striving to make the most of every opportunity and to live my life with purpose.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20, height: 1.5, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildHobbySection() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Hobbys',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255))),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildProjectsSection() {
    // Assume we have a list of projects, each with a name, description, and imageUrl
    List<Map<String, String>> projects = [
      {
        "name": "Project One",
        "description": "A brief description of what Project One entails.",
        "imageUrl": "https://example.com/project1.jpg",
      },
      {
        "name": "Project Two",
        "description": "A brief description of what Project Two entails.",
        "imageUrl": "https://example.com/project2.jpg",
      },
      // Add more projects as needed
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('My Projects',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple)),
          SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children:
                projects.map((project) => buildProjectCard(project)).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildProjectCard(Map<String, String> project) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 300,
        child: Column(
          children: <Widget>[
            Image.network(project['imageUrl']!, height: 180, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(project['name']!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(project['description']!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeroSection() {
    return Container(
      height: 300,
      color: Colors.deepPurple,
      child: Center(
        child: Text(
          'Your Name - Web Developer',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildGallerySection() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(6, (index) {
        return Card(
          child: Image.network('https://yourdomain.com/gallery/image$index.jpg',
              fit: BoxFit.cover),
        );
      }),
    );
  }

  Widget buildTextSection() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('About Me',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
              'Detailed text about your philosophy, your goals, and what you do.'),
        ],
      ),
    );
  }

  Widget buildContactForm() {
    // Implement a contact form or provide contact information
    return Container();
  }

  Widget buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('© 2025 Your Name'),
          InkWell(
            onTap: () => launch(githubURL),
            child: Text('GitHub'),
          ),
          InkWell(
            onTap: () => launch(linkedInURL),
            child: Text('LinkedIn'),
          ),
        ],
      ),
    );
  }
}
