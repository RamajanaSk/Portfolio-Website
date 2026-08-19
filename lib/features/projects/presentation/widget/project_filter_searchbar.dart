import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';

class ProjectFilterSearchBar extends StatefulWidget {
  final List<Project> allProjects;
  final Function(List<Project>) onFilterChanged;

  const ProjectFilterSearchBar({
    super.key,
    required this.allProjects,
    required this.onFilterChanged,
  });

  @override
  State<ProjectFilterSearchBar> createState() => _ProjectFilterSearchBarState();
}

class _ProjectFilterSearchBarState extends State<ProjectFilterSearchBar> {
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
        TextField(
          decoration: InputDecoration(
            hintText: context.l10n.searchProjects,
            prefixIcon: const Icon(Icons.search),
            filled: true,
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
              selectedColor: Theme.of(context).colorScheme.onPrimary,
              checkmarkColor: Theme.of(context).colorScheme.onSurface,
              labelStyle: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(context).colorScheme.onSurface,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
