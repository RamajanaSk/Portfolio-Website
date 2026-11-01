import 'package:flutter/material.dart';

class HomeExpertiseSection extends StatelessWidget {
  final int? projectCount;

  const HomeExpertiseSection({
    super.key,
    this.projectCount,
  }) : assert(projectCount == null || projectCount >= 0);

  static const _gradient = LinearGradient(
    colors: [
      Color(0xFFFF299D),
      Color(0xFF942BEA),
      Color(0xFF08BCEB),
    ],
  );

  static const _items = [
    _ExpertiseData(
      number: '01',
      title: 'MOBILE',
      tagline: 'MADE FOR EVERYDAY LIFE',
      description: 'I build mobile apps with intuitive interfaces, '
          'local storage and practical everyday features.',
      skills: ['Flutter', 'Dart', 'Kotlin', 'Android'],
      focus: 'From interface to app logic',
      icon: Icons.phone_android_rounded,
      accent: Color(0xFFFF299D),
    ),
    _ExpertiseData(
      number: '02',
      title: 'DEVELOPMENT',
      tagline: 'CONNECTING THE PIECES',
      description: 'I connect interfaces, APIs and databases '
          'to turn ideas into structured, working applications.',
      skills: ['Java', 'JavaScript', 'SQL', 'REST'],
      focus: 'Frontend meets backend',
      icon: Icons.data_object_rounded,
      accent: Color(0xFFAE57F5),
    ),
    _ExpertiseData(
      number: '03',
      title: 'CREATIVE',
      tagline: 'DESIGNED TO FEEL RIGHT',
      description: 'I explore responsive interfaces and interactive '
          'experiences through visual design, code and prototyping.',
      skills: ['UI Design', 'Responsive UI', 'Unity'],
      focus: 'Where design meets interaction',
      icon: Icons.auto_awesome_rounded,
      accent: Color(0xFF08BCEB),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final foreground = theme.colorScheme.onSurface;
    final purple = dark ? const Color(0xFFAE57F5) : const Color(0xFF7923B6);

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 20 : 32,
            vertical: mobile ? 36 : 64,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LayoutBuilder(
                    builder: (context, inner) {
                      const gap = 18.0;

                      if (inner.maxWidth < 900) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (var i = 0; i < _items.length; i++) ...[
                              if (i > 0) const SizedBox(height: gap),
                              _ExpertiseCard(data: _items[i]),
                            ],
                          ],
                        );
                      }

                      // Match card heights to the longest content.
                      return IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (var i = 0; i < _items.length; i++) ...[
                              if (i > 0) const SizedBox(width: gap),
                              Expanded(
                                child: _ExpertiseCard(
                                  data: _items[i],
                                  equalHeight: true,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
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

class _ProjectBadge extends StatelessWidget {
  final int count;

  const _ProjectBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final foreground = theme.colorScheme.onSurface;
    final accent = dark ? const Color(0xFF08BCEB) : const Color(0xFF007D9E);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: foreground.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: foreground.withValues(alpha: 0.12),
        ),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: count.toString().padLeft(2, '0'),
              style: TextStyle(
                color: accent,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: count == 1 ? '  PROJECT BUILT' : '  PROJECTS BUILT',
              style: TextStyle(
                color: foreground.withValues(alpha: 0.75),
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpertiseData {
  final String number;
  final String title;
  final String tagline;
  final String description;
  final List<String> skills;
  final String focus;
  final IconData icon;
  final Color accent;

  const _ExpertiseData({
    required this.number,
    required this.title,
    required this.tagline,
    required this.description,
    required this.skills,
    required this.focus,
    required this.icon,
    required this.accent,
  });
}

class _ExpertiseCard extends StatelessWidget {
  final _ExpertiseData data;
  final bool equalHeight;

  const _ExpertiseCard({
    required this.data,
    this.equalHeight = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final foreground = theme.colorScheme.onSurface;

    final accent =
        dark ? data.accent : Color.lerp(data.accent, Colors.black, 0.3)!;

    final background = dark
        ? const Color(0xFF111114)
        : Color.alphaBlend(
            data.accent.withValues(alpha: 0.025),
            theme.colorScheme.surface,
          );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: foreground.withValues(alpha: 0.10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: equalHeight ? MainAxisSize.max : MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${data.number} /',
                    style: TextStyle(
                      color: foreground.withValues(alpha: 0.4),
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                ExcludeSemantics(
                  child: Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: accent.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Icon(
                      data.icon,
                      color: accent,
                      size: 29,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              data.title,
              style: TextStyle(
                color: foreground,
                fontSize: 26,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: 36,
              height: 3,
              color: accent,
            ),
            const SizedBox(height: 20),
            Text(
              data.tagline,
              style: TextStyle(
                color: accent,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              data.description,
              style: TextStyle(
                color: foreground.withValues(alpha: 0.66),
                fontSize: 13,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final skill in data.skills)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: foreground.withValues(alpha: 0.035),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: foreground.withValues(alpha: 0.09),
                      ),
                    ),
                    child: Text(
                      skill,
                      style: TextStyle(
                        color: foreground.withValues(alpha: 0.8),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 28),
            if (equalHeight) const Spacer(),
            Divider(
              height: 1,
              color: foreground.withValues(alpha: 0.10),
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '+  ',
                    style: TextStyle(
                      color: accent,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(text: data.focus),
                ],
              ),
              style: TextStyle(
                color: foreground.withValues(alpha: 0.55),
                fontSize: 11,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
