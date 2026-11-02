import 'package:flutter/material.dart';

class SectionNavigationItem {
  final String number;
  final String label;
  final GlobalKey key;
  final Color color;

  const SectionNavigationItem({
    required this.number,
    required this.label,
    required this.key,
    required this.color,
  });
}

class SectionScrollNavigation extends StatelessWidget {
  final List<SectionNavigationItem> sections;
  final int activeIndex;
  final ValueChanged<int> onSelected;

  const SectionScrollNavigation({
    super.key,
    required this.sections,
    required this.activeIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < sections.length; i++) ...[
            Tooltip(
              message: sections[i].label,
              preferBelow: false,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onSelected(i),
                  mouseCursor: SystemMouseCursors.click,
                  borderRadius: BorderRadius.circular(8),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    width: 42,
                    height: 38,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: i == activeIndex
                          ? sections[i].color.withValues(alpha: 0.12)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        right: BorderSide(
                          color: i == activeIndex
                              ? sections[i].color
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      sections[i].number,
                      style: TextStyle(
                        color: i == activeIndex
                            ? sections[i].color
                            : foreground.withValues(alpha: 0.45),
                        fontSize: 12,
                        fontWeight: i == activeIndex
                            ? FontWeight.w900
                            : FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (i < sections.length - 1)
              Container(
                width: 1,
                height: 10,
                color: foreground.withValues(alpha: 0.12),
              ),
          ],
        ],
      ),
    );
  }
}
