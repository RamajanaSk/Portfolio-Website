import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project_version.dart';

class VersionSelector extends StatelessWidget {
  final List<ProjectVersion> versions;
  final ProjectVersion selectedVersion;
  final ValueChanged<ProjectVersion> onSelected;

  const VersionSelector({
    required this.versions,
    required this.selectedVersion,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: versions.map((version) {
          final selected = selectedVersion.version == version.version;

          return _VersionButton(
            label: version.version,
            selected: selected,
            onTap: () => onSelected(version),
          );
        }).toList(),
      ),
    );
  }
}

class _VersionButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _VersionButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          color: selected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? colorScheme.primary : colorScheme.outlineVariant,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: selected ? colorScheme.onPrimary : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
