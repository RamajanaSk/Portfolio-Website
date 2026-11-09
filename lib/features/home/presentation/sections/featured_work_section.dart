import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_colors.dart';
import 'package:ramajana05/core/widgets/text/section_header.dart';

import 'package:ramajana05/data/dummyData.dart';
import 'package:ramajana05/data/models/project.dart';

class FeaturedWorkSection extends StatelessWidget {
  const FeaturedWorkSection({super.key});

  static const _accent = AppColors.blue;

  @override
  Widget build(BuildContext context) {
    final projects = getDummyProjects(context).cast<Project>();

    final matches = projects.where(
      (p) => p.name.toLowerCase() == 'traveler remake',
    );

    if (matches.isEmpty) {
      return const SizedBox.shrink();
    }

    final project = matches.first;

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 700;

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
                    accentColor: _accent,
                  ),
                  const SizedBox(height: 28),
                  _TravelerShowcase(
                    project: project,
                    onTap: () => context.go('/projects/traveler-remake'),
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

class _TravelerShowcase extends StatefulWidget {
  final Project project;
  final VoidCallback onTap;

  const _TravelerShowcase({
    required this.project,
    required this.onTap,
  });

  @override
  State<_TravelerShowcase> createState() => _TravelerShowcaseState();
}

class _TravelerShowcaseState extends State<_TravelerShowcase> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final foreground = theme.colorScheme.onSurface;

    final background = dark ? const Color(0xFF171B29) : const Color(0xFFF5F5F7);

    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = constraints.maxWidth < 850;

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
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: _hovered
                      ? AppColors.blue.withValues(alpha: 0.6)
                      : foreground.withValues(alpha: 0.1),
                ),
              ),
              child: stacked
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _ShowcaseImage(
                          project: widget.project,
                          height: 280,
                        ),
                        _ShowcaseContent(
                          project: widget.project,
                          compact: true,
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 11,
                          child: _ShowcaseImage(
                            project: widget.project,
                            height: 480,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: _ShowcaseContent(
                            project: widget.project,
                            compact: false,
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

class _ShowcaseImage extends StatefulWidget {
  final Project project;
  final double? height;

  const _ShowcaseImage({
    required this.project,
    this.height,
  });

  @override
  State<_ShowcaseImage> createState() => _ShowcaseImageState();
}

class _ShowcaseImageState extends State<_ShowcaseImage> {
  Timer? _timer;
  int _currentIndex = 0;

  late List<String> _images;

  @override
  void initState() {
    super.initState();
    _initializeImages();
    _startSlideshow();
  }

  void _initializeImages() {
    _images = [
      widget.project.previewPicture,
      ...widget.project.gallery,
    ].where((path) => path.isNotEmpty).toSet().toList();
  }

  void _startSlideshow() {
    _timer?.cancel();

    if (_images.length <= 1) return;

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        if (!mounted) return;

        setState(() {
          _currentIndex = (_currentIndex + 1) % _images.length;
        });
      },
    );
  }

  @override
  void didUpdateWidget(covariant _ShowcaseImage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.project != widget.project) {
      _initializeImages();
      _currentIndex = 0;
      _startSlideshow();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (final path in _images) {
      precacheImage(AssetImage(path), context);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color(0xFF101827),
          ),

          // Smooth image transition
          if (_images.isNotEmpty)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              layoutBuilder: (currentChild, previousChildren) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    ...previousChildren,
                    if (currentChild != null) currentChild,
                  ],
                );
              },
              child: Image.asset(
                _images[_currentIndex],
                key: ValueKey(_images[_currentIndex]),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                gaplessPlayback: true,
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(
                    Icons.map_outlined,
                    color: AppColors.blue,
                    size: 72,
                  ),
                ),
              ),
            ),

          // Gradient overlay
          const IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x44000000),
                    Colors.transparent,
                    Color(0x88000000),
                  ],
                ),
              ),
            ),
          ),

          // Bachelor badge
          const Positioned(
            top: 20,
            left: 20,
            child: _ImageBadge(
              label: 'BACHELOR THESIS ORIGIN',
            ),
          ),

          // Bottom label
          const Positioned(
            bottom: 44,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'EXPLORE THE REAL WORLD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Slideshow indicators
          if (_images.length > 1)
            Positioned(
              bottom: 18,
              left: 20,
              child: Row(
                children: List.generate(
                  _images.length,
                  (index) {
                    final active = index == _currentIndex;

                    return AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      margin: const EdgeInsets.only(right: 6),
                      width: active ? 24 : 6,
                      height: 4,
                      decoration: BoxDecoration(
                        color: active
                            ? AppColors.blue
                            : Colors.white.withValues(
                                alpha: 0.4,
                              ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ImageBadge extends StatelessWidget {
  final String label;

  const _ImageBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: const Color(0xDD101827),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: AppColors.blue.withValues(alpha: 0.4),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF8BD5FF),
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}

class _ShowcaseContent extends StatelessWidget {
  final Project project;
  final bool compact;

  const _ShowcaseContent({
    required this.project,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: EdgeInsets.all(compact ? 22 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                Icons.circle,
                size: 7,
                color: AppColors.blue,
              ),
              const SizedBox(width: 8),
              Text(
                'FEATURED PROJECT',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_outward_rounded,
                color: AppColors.blue,
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            project.name,
            style: TextStyle(
              color: foreground,
              fontSize: compact ? 27 : 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            project.catchPhrase,
            style: TextStyle(
              color: AppColors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            project.shortDescription,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: foreground.withValues(alpha: 0.65),
              fontSize: 14,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.technologies
                .take(4)
                .map(
                  (tech) => _TechChip(label: tech),
                )
                .toList(),
          ),
          const SizedBox(height: 26),
          Divider(
            color: foreground.withValues(alpha: 0.1),
            height: 1,
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: _InfoStat(
                  label: 'ORIGIN',
                  value: 'B.Sc. Thesis',
                  detail: 'Grade 1.0',
                ),
              ),
              Expanded(
                child: _InfoStat(
                  label: 'REMAKE',
                  value: '2026',
                  detail: 'Ongoing',
                ),
              ),
              Expanded(
                child: _InfoStat(
                  label: 'DEVELOPMENT',
                  value: 'Solo',
                  detail: 'Mobile App',
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EXPLORE PROJECT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;

  const _TechChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: AppColors.blue.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.blue.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground.withValues(alpha: 0.8),
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoStat extends StatelessWidget {
  final String label;
  final String value;
  final String detail;

  const _InfoStat({
    required this.label,
    required this.value,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: foreground.withValues(alpha: 0.45),
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: foreground,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          detail,
          style: TextStyle(
            color: foreground.withValues(alpha: 0.55),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
