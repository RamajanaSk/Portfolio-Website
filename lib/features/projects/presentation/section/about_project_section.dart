import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/hexcolor.dart';
import 'package:ramajana05/data/models/project.dart';

class AboutProjectSection extends StatelessWidget {
  final Project project;

  const AboutProjectSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 850;

    final accent = project.hexcolor.toColor();
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // ============================================================
          // LARGE BACKGROUND PROJECT NAME
          // ============================================================

          Positioned(
            right: -20,
            bottom: -30,
            child: IgnorePointer(
              child: Opacity(
                opacity: .025,
                child: Text(
                  project.name.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(
                    color: foreground,
                    fontSize: isMobile ? 90 : 170,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -6,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),

          // ============================================================
          // SUBTLE ACCENT GLOW
          // ============================================================

          Positioned(
            left: -100,
            top: 80,
            child: IgnorePointer(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: accent.withValues(alpha: .08),
                      blurRadius: 130,
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ============================================================
          // CONTENT
          // ============================================================

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 80 : 120,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1400,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ====================================================
                  // EYEBROW
                  // ====================================================

                  _SectionLabel(
                    accent: accent,
                  ),

                  SizedBox(height: isMobile ? 42 : 65),

                  // ====================================================
                  // MAIN CONTENT
                  // ====================================================

                  if (isMobile)
                    _MobileContent(
                      project: project,
                      accent: accent,
                    )
                  else
                    _DesktopContent(
                      project: project,
                      accent: accent,
                    ),

                  SizedBox(height: isMobile ? 55 : 80),

                  // ====================================================
                  // META INFORMATION
                  // ====================================================

                  _ProjectMeta(
                    project: project,
                    accent: accent,
                    isMobile: isMobile,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final Color accent;

  const _SectionLabel({
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '01',
          style: TextStyle(
            color: accent,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 28,
          height: 1,
          color: accent.withValues(alpha: .8),
        ),
        const SizedBox(width: 12),
        Text(
          'ABOUT THE PROJECT',
          style: TextStyle(
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: .45),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.5,
          ),
        ),
      ],
    );
  }
}

class _DesktopContent extends StatelessWidget {
  final Project project;
  final Color accent;

  const _DesktopContent({
    required this.project,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ============================================================
        // LEFT — STATEMENT
        // ============================================================

        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(right: 70),
            child: _ProjectStatement(
              project: project,
              accent: accent,
            ),
          ),
        ),

        // ============================================================
        // SMALL VERTICAL DIVIDER
        // ============================================================

        Container(
          width: 1,
          height: 220,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .08),
        ),

        const SizedBox(width: 70),

        // ============================================================
        // RIGHT — DESCRIPTION
        // ============================================================

        Expanded(
          flex: 5,
          child: _ProjectDescription(
            project: project,
            accent: accent,
          ),
        ),
      ],
    );
  }
}

class _MobileContent extends StatelessWidget {
  final Project project;
  final Color accent;

  const _MobileContent({
    required this.project,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProjectStatement(
          project: project,
          accent: accent,
        ),
        const SizedBox(height: 40),
        Container(
          width: 50,
          height: 1,
          color: accent.withValues(alpha: .5),
        ),
        const SizedBox(height: 40),
        _ProjectDescription(
          project: project,
          accent: accent,
        ),
      ],
    );
  }
}

class _ProjectStatement extends StatelessWidget {
  final Project project;
  final Color accent;

  const _ProjectStatement({
    required this.project,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 850;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FROM AN IDEA',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: isMobile ? 34 : 52,
            fontWeight: FontWeight.w800,
            height: .98,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'TO EXPERIENCE.',
          style: TextStyle(
            color: accent,
            fontSize: isMobile ? 34 : 52,
            fontWeight: FontWeight.w800,
            height: .98,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 26),
        Container(
          width: 34,
          height: 3,
          decoration: BoxDecoration(
            color: accent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

class _ProjectDescription extends StatelessWidget {
  final Project project;
  final Color accent;

  const _ProjectDescription({
    required this.project,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.shortDescription,
          style: TextStyle(
            color: foreground.withValues(alpha: .88),
            fontSize: 19,
            height: 1.55,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          project.longDescription,
          style: TextStyle(
            color: foreground.withValues(alpha: .48),
            fontSize: 15,
            height: 1.8,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _ProjectMeta extends StatelessWidget {
  final Project project;
  final Color accent;
  final bool isMobile;

  const _ProjectMeta({
    required this.project,
    required this.accent,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: isMobile ? 30 : 34,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: foreground.withValues(alpha: .08),
          ),
        ),
      ),
      child: Wrap(
        spacing: isMobile ? 40 : 90,
        runSpacing: 32,
        children: [
          _MetaItem(
            number: '01',
            label: 'ROLE',
            value: project.role,
            accent: accent,
          ),
          _MetaItem(
            number: '02',
            label: 'PROJECT',
            value: project.isSolo ? 'Solo Project' : 'Team Project',
            accent: accent,
          ),
          _MetaItem(
            number: '03',
            label: 'PLATFORM',
            value: 'Flutter',
            accent: accent,
          ),
          _MetaItem(
            number: '04',
            label: 'TECH',
            value: project.technologies.take(3).join(' · '),
            accent: accent,
          ),
        ],
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final String number;
  final String label;
  final String value;
  final Color accent;

  const _MetaItem({
    required this.number,
    required this.label,
    required this.value,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                number,
                style: TextStyle(
                  color: accent,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: foreground.withValues(alpha: .3),
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: foreground.withValues(alpha: .85),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
