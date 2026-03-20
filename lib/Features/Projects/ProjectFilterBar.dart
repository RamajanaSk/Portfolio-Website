import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';

class ProjectFilterBar extends StatefulWidget {
  final List<Project> allProjects;
  final Function(List<Project>) onFilterChanged;

  const ProjectFilterBar({
    super.key,
    required this.allProjects,
    required this.onFilterChanged,
  });

  @override
  State<ProjectFilterBar> createState() => _ProjectFilterBarState();
}

class _ProjectFilterBarState extends State<ProjectFilterBar> {
  String searchText = '';
  Set<String> selectedTech = {};

  List<String> get allTechnologies {
    final tech = <String>{};
    for (var p in widget.allProjects) {
      tech.addAll(p.technologies);
    }
    return tech.toList()..sort();
  }

  void applyFilter() {
    final filtered = widget.allProjects.where((project) {
      final matchesSearch =
          project.name.toLowerCase().contains(searchText.toLowerCase()) ||
              project.shortDescription
                  .toLowerCase()
                  .contains(searchText.toLowerCase());

      final matchesTech = selectedTech.isEmpty ||
          selectedTech.every((tech) => project.technologies.contains(tech));

      return matchesSearch && matchesTech;
    }).toList();

    widget.onFilterChanged(filtered);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔍 SEARCH BAR
        TextField(
          decoration: InputDecoration(
            hintText: 'Search projects...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            searchText = value;
            applyFilter();
          },
        ),

        const SizedBox(height: 12),

        // 🏷️ TECH FILTER CHIPS
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: allTechnologies.map((tech) {
            final isSelected = selectedTech.contains(tech);

            return FilterChip(
              label: Text(tech),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedTech.add(tech);
                  } else {
                    selectedTech.remove(tech);
                  }
                  applyFilter();
                });
              },
              selectedColor: Colors.black,
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
