import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/data/models/project.dart';

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
    final technologies = <String>{};

    for (final project in widget.allProjects) {
      technologies.addAll(project.technologies);
    }

    return technologies.toList()..sort();
  }

  bool get hasActiveFilters =>
      searchText.trim().isNotEmpty || selectedTech.isNotEmpty;

  void applyFilter() {
    final query = searchText.trim().toLowerCase();

    final filtered = widget.allProjects.where((project) {
      final matchesSearch = project.name.toLowerCase().contains(query) ||
          project.shortDescription.toLowerCase().contains(query);

      final matchesTech = selectedTech.isEmpty ||
          selectedTech.every(
            (tech) => project.technologies.contains(tech),
          );

      return matchesSearch && matchesTech;
    }).toList();

    widget.onFilterChanged(filtered);
  }

  void clearFilters() {
    setState(() {
      searchText = '';
      selectedTech.clear();
    });

    applyFilter();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProjectSearchField(
          hintText: context.l10n.searchProjects,
          onChanged: (value) {
            setState(() {
              searchText = value;
            });

            applyFilter();
          },
        ),
        SizedBox(height: isMobile ? 20 : 28),
        Wrap(
          spacing: 9,
          runSpacing: 9,
          children: allTechnologies.map((tech) {
            return _TechnologyChip(
              label: tech,
              selected: selectedTech.contains(tech),
              onPressed: () {
                setState(() {
                  if (selectedTech.contains(tech)) {
                    selectedTech.remove(tech);
                  } else {
                    selectedTech.add(tech);
                  }
                });

                applyFilter();
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ProjectSearchField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const _ProjectSearchField({
    required this.hintText,
    required this.onChanged,
  });

  @override
  State<_ProjectSearchField> createState() => _ProjectSearchFieldState();
}

class _ProjectSearchFieldState extends State<_ProjectSearchField> {
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _focused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: _focused
            ? [
                BoxShadow(
                  color: AppColors.vibrantPink.withValues(alpha: .08),
                  blurRadius: 24,
                  spreadRadius: 1,
                ),
              ]
            : [],
      ),
      child: TextField(
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        cursorColor: AppColors.vibrantPink,
        style: TextStyle(
          color: foreground.withValues(alpha: .9),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: foreground.withValues(alpha: .25),
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 6,
              right: 2,
            ),
            child: Icon(
              Icons.search_rounded,
              size: 20,
              color: _focused
                  ? AppColors.vibrantPink
                  : foreground.withValues(alpha: .35),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 46,
          ),
          filled: true,
          fillColor: foreground.withValues(alpha: .025),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: foreground.withValues(alpha: .07),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.vibrantPink,
              width: 1.2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _TechnologyChip extends StatefulWidget {
  final String label;
  final bool selected;
  final VoidCallback onPressed;

  const _TechnologyChip({
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  @override
  State<_TechnologyChip> createState() => _TechnologyChipState();
}

class _TechnologyChipState extends State<_TechnologyChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
        scale: _hovered ? 1.025 : 1,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: widget.selected
                  ? AppColors.vibrantPink.withValues(alpha: .09)
                  : foreground.withValues(
                      alpha: _hovered ? .045 : .025,
                    ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.selected
                    ? AppColors.vibrantPink.withValues(alpha: .65)
                    : foreground.withValues(
                        alpha: _hovered ? .16 : .07,
                      ),
              ),
              boxShadow: widget.selected
                  ? [
                      BoxShadow(
                        color: AppColors.vibrantPink.withValues(alpha: .08),
                        blurRadius: 16,
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.selected
                        ? AppColors.vibrantPink
                        : foreground.withValues(alpha: .2),
                  ),
                ),
                const SizedBox(width: 9),
                Text(
                  widget.label.toUpperCase(),
                  style: TextStyle(
                    color: widget.selected
                        ? foreground.withValues(alpha: .95)
                        : foreground.withValues(alpha: .5),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .8,
                  ),
                ),
                if (widget.selected) ...[
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.close_rounded,
                    size: 13,
                    color: AppColors.vibrantPink,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
