
import 'package:flutter/material.dart';

class HomeExpertiseSection extends StatelessWidget {
  const HomeExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        const cards = [
          _ExpertiseCard(
            number: '01',
            title: 'MOBILE',
            subtitle: 'Flutter · Android',
            description: 'Apps built for everyday experiences.',
            icon: Icons.smartphone_rounded,
            accent: Color(0xFF8A2BE2),
            lightBackground: Color(0xFFF3EEFC),
            iconBackground: Color(0xFFE5D6FA),
          ),
          _ExpertiseCard(
            number: '02',
            title: 'DEVELOPMENT',
            subtitle: 'Dart · Kotlin · Java',
            description: 'Thoughtful code. Reliable solutions.',
            icon: Icons.code_rounded,
            accent: Color(0xFF009FC2),
            lightBackground: Color(0xFFEAF7FA),
            iconBackground: Color(0xFFD1EEF5),
          ),
          _ExpertiseCard(
            number: '03',
            title: 'CREATIVE',
            subtitle: 'UI · Interactive',
            description: 'Making digital experiences feel alive.',
            icon: Icons.palette_outlined,
            accent: Color(0xFF19B78A),
            lightBackground: Color(0xFFEAF8F1),
            iconBackground: Color(0xFFD1F0E0),
          ),
        ];

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 64,
            vertical: isMobile ? 24 : 40,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: isMobile
                  ? Column(
                      children: [
                        cards[0],
                        SizedBox(height: 14),
                        cards[1],
                        SizedBox(height: 14),
                        cards[2],
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: cards[0]),
                        const SizedBox(width: 16),
                        Expanded(child: cards[1]),
                        const SizedBox(width: 16),
                        Expanded(child: cards[2]),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _ExpertiseCard extends StatefulWidget {
  final String number;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color accent;
  final Color lightBackground;
  final Color iconBackground;

  const _ExpertiseCard({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.accent,
    required this.lightBackground,
    required this.iconBackground,
  });

  @override
  State<_ExpertiseCard> createState() => _ExpertiseCardState();
}

class _ExpertiseCardState extends State<_ExpertiseCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    final duration = reduceMotion
        ? Duration.zero
        : const Duration(milliseconds: 200);

    final background = isDark
        ? Color.lerp(
            const Color(0xFF202024),
            widget.accent,
            _hovered ? 0.14 : 0.07,
          )!
        : widget.lightBackground;

    final foreground = theme.colorScheme.onSurface;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedSlide(
        duration: duration,
        curve: Curves.easeOutCubic,
        offset: _hovered ? const Offset(0, -0.025) : Offset.zero,
        child: AnimatedContainer(
          duration: duration,
          curve: Curves.easeOutCubic,
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 260),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.accent.withValues(
                alpha: _hovered ? 0.35 : 0.08,
              ),
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.accent.withValues(alpha: 0.10),
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.number} / EXPERTISE',
                    style: TextStyle(
                      color: foreground.withValues(alpha: 0.48),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                  AnimatedSlide(
                    duration: duration,
                    offset: _hovered
                        ? const Offset(0.15, -0.15)
                        : Offset.zero,
                    child: Icon(
                      Icons.arrow_outward_rounded,
                      size: 18,
                      color: widget.accent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: isDark
                        ? widget.accent.withValues(alpha: 0.16)
                        : widget.iconBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    widget.icon,
                    size: 36,
                    color: widget.accent,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                widget.title,
                style: TextStyle(
                  color: foreground,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.subtitle,
                style: TextStyle(
                  color: foreground.withValues(alpha: 0.65),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description,
                style: TextStyle(
                  color: foreground.withValues(alpha: 0.50),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: widget.accent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
