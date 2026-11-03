import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/widgets/text/section_header.dart';

import 'package:ramajana05/data/dummyData.dart';
import 'package:ramajana05/data/models/project.dart';

class FeaturedWorkSection extends StatelessWidget {
  const FeaturedWorkSection({super.key});

  static const _pink = Color(0xFFFF299D);
  static const _cyan = Color(0xFF08BCEB);
  static const _purple = Color(0xFFAE8BFF);

  static const _featuredNames = [
    'Traveler',
  ];

  List<Project> _featuredProjects(List<Project> projects) {
    final selected = <Project>[];

    for (final name in _featuredNames) {
      for (final project in projects) {
        if (project.name.toLowerCase() == name.toLowerCase() &&
            !selected.contains(project)) {
          selected.add(project);
          break;
        }
      }
    }

    for (final project in projects) {
      if (selected.length >= 3) break;
      if (!selected.contains(project)) {
        selected.add(project);
      }
    }

    return selected.take(3).toList();
  }

  void _openProject(BuildContext context, Project project) {
    final slug =
        project.name.toLowerCase().trim().replaceAll(RegExp(r'\s+'), '-');

    context.go('/projects/$slug');
  }

  @override
  Widget build(BuildContext context) {
    final projects = _featuredProjects(
      getDummyProjects(context).cast<Project>(),
    );

    final foreground = Theme.of(context).colorScheme.onSurface;

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 20 : 32,
            vertical: mobile ? 40 : 72,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    number: '02',
                    title: context.l10n.featuredProjects.toUpperCase(),
                    accentColor: AppColors.blue,
                  ),
                  const SizedBox(height: 18),
                  if (projects.isNotEmpty)
                    _ProjectCard(
                      project: projects.first,
                      number: '01',
                      accent: _pink,
                      featured: true,
                      onTap: () => _openProject(
                        context,
                        projects.first,
                      ),
                    ),
                  if (projects.length > 1) ...[
                    const SizedBox(height: 20),
                    LayoutBuilder(
                      builder: (context, inner) {
                        final stacked = inner.maxWidth < 760;

                        final cards = [
                          for (int i = 1; i < projects.length; i++)
                            _ProjectCard(
                              project: projects[i],
                              number: (i + 1).toString().padLeft(2, '0'),
                              accent: i == 1 ? _cyan : _purple,
                              featured: false,
                              onTap: () => _openProject(
                                context,
                                projects[i],
                              ),
                            ),
                        ];

                        if (stacked) {
                          return Column(
                            children: [
                              for (int i = 0; i < cards.length; i++) ...[
                                if (i > 0) const SizedBox(height: 20),
                                cards[i],
                              ],
                            ],
                          );
                        }

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < cards.length; i++) ...[
                              if (i > 0) const SizedBox(width: 20),
                              Expanded(child: cards[i]),
                            ],
                          ],
                        );
                      },
                    ),
                  ],
                  const SizedBox(height: 36),
                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () => context.go('/projects'),
                      icon: const Icon(Icons.arrow_outward_rounded),
                      label: const Text('VIEW ALL PROJECTS'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: foreground,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 20,
                        ),
                        side: BorderSide(
                          color: foreground.withValues(alpha: 0.2),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final String number;
  final Color accent;
  final bool featured;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.project,
    required this.number,
    required this.accent,
    required this.featured,
    required this.onTap,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final foreground = theme.colorScheme.onSurface;

    final background = dark ? const Color(0xFF171B29) : const Color(0xFFF5F5F7);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: _hovered
                  ? widget.accent.withValues(alpha: 0.65)
                  : foreground.withValues(alpha: 0.09),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: widget.featured ? 2.4 : 1.55,
                child: _ProjectArtwork(
                  project: widget.project,
                  accent: widget.accent,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(widget.featured ? 28 : 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.number} / PROJECT',
                          style: TextStyle(
                            color: widget.accent,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const Spacer(),
                        AnimatedRotation(
                          turns: _hovered ? 0.125 : 0,
                          duration: const Duration(milliseconds: 180),
                          child: Icon(
                            Icons.arrow_outward_rounded,
                            size: 22,
                            color: widget.accent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      widget.project.name,
                      style: TextStyle(
                        color: foreground,
                        fontSize: widget.featured ? 30 : 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.7,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project.shortDescription,
                      maxLines: widget.featured ? 3 : 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: foreground.withValues(alpha: 0.65),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 1,
                      color: foreground.withValues(alpha: 0.1),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.project.catchPhrase,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: foreground.withValues(alpha: 0.65),
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.north_east_rounded,
                          color: widget.accent,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectArtwork extends StatelessWidget {
  final Project project;
  final Color accent;

  const _ProjectArtwork({
    required this.project,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    // Assumes previewPicture is a nullable String asset path.
    // Change Image.asset to Image.network if it stores URLs.
    final path = project.previewPicture;

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                accent.withValues(alpha: 0.25),
                const Color(0xFF101522),
                const Color(0xFF080B13),
              ],
            ),
          ),
        ),
        // ignore: unnecessary_null_comparison
        if (path != null && path.isNotEmpty)
          Image.asset(
            path,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0x88000000),
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xCC101522),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              project.name.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
