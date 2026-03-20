import 'package:flutter/material.dart';
import 'package:ramajana05/Sections/HobbiesSection.dart';
import 'package:ramajana05/Sections/SkillsSection.dart';
import 'package:url_launcher/url_launcher.dart';

class GamesCategoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> unityProjects = [
    {
      'title': 'Traveler',
      'image': 'assets/project1.jpg',
      'description': 'BA Thesis',
    },
    {
      'title': 'Fruit Ninja VR',
      'image': 'assets/project2.jpg',
      'description': 'Description of Project 2',
    },
    {
      'title': 'Splatoon VR',
      'image': 'assets/project2.jpg',
      'description': 'Description of Project 2',
    },
    {
      'title': 'VR Rage Room',
      'image': 'assets/project2.jpg',
      'description': 'Description of Project 2',
    },
    {
      'title': 'Monitor your Vineyard',
      'image': 'assets/project2.jpg',
      'description': 'Description of Project 2',
    },
    {
      'title': 'Fornite',
      'image': 'assets/project2.jpg',
      'description': 'Description of Project 2',
    },

    {
      'title': 'Arknoid 3D',
      'image': 'assets/project2.jpg',
      'description': 'Description of Project 2',
    },
    {
      'title': 'Perspective',
      'image': 'assets/project2.jpg',
      'description': 'Description of Project 2',
    },
    {
      'title': 'Race Quit',
      'image': 'assets/project2.jpg',
      'description': 'Description of Project 2',
    },

    // Add more projects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Increased height for better display
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: unityProjects.length,
        itemBuilder: (context, index) {
          return Container(
            width: 200, // Increased width for each card
            padding: EdgeInsets.all(10),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)), // Rounded edges
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      unityProjects[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            unityProjects[index]['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement navigation to detailed project screen
                          },
                          child: Text('More'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      unityProjects[index]['description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
