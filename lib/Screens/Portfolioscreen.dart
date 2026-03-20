import 'package:flutter/material.dart';
import 'package:ramajana05/Data/dummyData.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/Screens/ProjectDetailScreen.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  Project? selectedProject;

  @override
  Widget build(BuildContext context) {
    if (selectedProject != null) {
      // Detailseite für ausgewähltes Projekt
      return Column(
        children: [
          // Optional: Button zurück zur Projektliste
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedProject = null;
                });
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Back to Projects"),
            ),
          ),
          //Expanded(child: ProjectScreen(project: selectedProject!)),
        ],
      );
    }

    // Standard-Ansicht: Projektliste
    return ListView.builder(
      itemCount: dummyProjects.length,
      itemBuilder: (context, index) {
        final Project project = dummyProjects[index];

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(project.name),
            subtitle: Text(project.shortDescription),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              setState(() {
                selectedProject = project;
              });
            },
          ),
        );
      },
    );
  }
}
