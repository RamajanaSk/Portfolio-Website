import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';

class HomeCTASection extends StatefulWidget {
  final VoidCallback onContactPressed;

  const HomeCTASection({
    super.key,
    required this.onContactPressed,
  });

  @override
  State<HomeCTASection> createState() => _HomeCTASectionState();
}

class _HomeCTASectionState extends State<HomeCTASection> {
  int _currentIndex = 0;
  Timer? _timer;

  static const _slides = [
    _CTASlide(
      word: 'MEMORABLE.',
      colors: [
        Color(0xFFFF2D95),
        Color(0xFF8A2BE2),
      ],
    ),
    _CTASlide(
      word: 'BEAUTIFUL.',
      colors: [
        Color(0xFF8A2BE2),
        Color(0xFF00CFFF),
      ],
    ),
    _CTASlide(
      word: 'USEFUL.',
      colors: [
        Color(0xFF00CFFF),
        Color(0xFF35E6A5),
      ],
    ),
    _CTASlide(
      word: 'YOURS.',
      colors: [
        Color(0xFFFF2D95),
        Color(0xFF8A2BE2),
        Color(0xFF00CFFF),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(milliseconds: 3200),
      (_) {
        if (!mounted) return;

        setState(() {
          _currentIndex = (_currentIndex + 1) % _slides.length;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 700;

    final slide = _slides[_currentIndex];

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: isMobile ? 520 : 620,
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // ============================================================
          // ANIMATED BACKGROUND GLOW
          // ============================================================

          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeInOutCubic,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0, 1.35),
                    radius: 1,
                    colors: [
                      slide.colors.first.withValues(alpha: .13),
                      slide.colors.last.withValues(alpha: .05),
                      Colors.transparent,
                    ],
                    stops: const [
                      0,
                      .45,
                      1,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ============================================================
          // HUGE BACKGROUND WORD
          // ============================================================

          Positioned(
            left: -30,
            right: -30,
            bottom: -35,
            child: IgnorePointer(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: Text(
                  slide.word,
                  key: ValueKey(slide.word),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: slide.colors.first.withValues(alpha: .025),
                    fontSize: isMobile ? 100 : 190,
                    height: 1,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -7,
                  ),
                ),
              ),
            ),
          ),

          // ============================================================
          // TOP GRADIENT LINE
          // ============================================================

          Positioned(
            top: 0,
            left: isMobile ? 24 : 80,
            right: isMobile ? 24 : 80,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    ...slide.colors,
                    Colors.transparent,
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
              vertical: isMobile ? 80 : 110,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1000,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ==================================================
                    // EYEBROW
                    // ==================================================

                    _buildEyebrow(context, slide),

                    SizedBox(height: isMobile ? 35 : 45),

                    // ==================================================
                    // STATIC HEADING
                    // ==================================================

                    Text(
                      'LET\'S BUILD SOMETHING',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: isMobile ? 34 : 60,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        letterSpacing: isMobile ? -1 : -2,
                      ),
                    ),

                    SizedBox(height: isMobile ? 5 : 8),

                    // ==================================================
                    // ANIMATED WORD
                    // ==================================================

                    SizedBox(
                      height: isMobile ? 48 : 78,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 650),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, animation) {
                          final offset = Tween<Offset>(
                            begin: const Offset(0, .8),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOutCubic,
                            ),
                          );

                          return ClipRect(
                            child: FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: offset,
                                child: child,
                              ),
                            ),
                          );
                        },
                        child: _GradientWord(
                          key: ValueKey(slide.word),
                          text: slide.word,
                          colors: slide.colors,
                          isMobile: isMobile,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ==================================================
                    // DESCRIPTION
                    // ==================================================

                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 570,
                      ),
                      child: Text(
                        'Have a project, an idea, or just want to '
                        'create something interesting? Let\'s talk.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: .48),
                          fontSize: isMobile ? 14 : 16,
                          height: 1.7,
                        ),
                      ),
                    ),

                    const SizedBox(height: 38),

                    // ==================================================
                    // BUTTON
                    // ==================================================

                    _ContactButton(
                      colors: slide.colors,
                      onPressed: widget.onContactPressed,
                    ),

                    const SizedBox(height: 45),

                    // ==================================================
                    // SLIDE INDICATORS
                    // ==================================================

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        _slides.length,
                        (index) {
                          final active = index == _currentIndex;

                          return AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 350,
                            ),
                            curve: Curves.easeOutCubic,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            width: active ? 28 : 5,
                            height: 5,
                            decoration: BoxDecoration(
                              gradient: active
                                  ? LinearGradient(
                                      colors: slide.colors,
                                    )
                                  : null,
                              color: active
                                  ? null
                                  : Colors.white.withValues(
                                      alpha: .15,
                                    ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEyebrow(
    BuildContext context,
    _CTASlide slide,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 1,
          color: slide.colors.first,
        ),
        const SizedBox(width: 12),
        Text(
          'HAVE AN IDEA?',
          style: TextStyle(
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: .45),
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 28,
          height: 1,
          color: slide.colors.last,
        ),
      ],
    );
  }
}

class _CTASlide {
  final String word;
  final List<Color> colors;

  const _CTASlide({
    required this.word,
    required this.colors,
  });
}

class _GradientWord extends StatelessWidget {
  final String text;
  final List<Color> colors;
  final bool isMobile;

  const _GradientWord({
    super.key,
    required this.text,
    required this.colors,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colors,
        ).createShader(bounds);
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: isMobile ? 40 : 68,
          height: 1,
          fontWeight: FontWeight.w900,
          letterSpacing: isMobile ? -1 : -2,
        ),
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  final List<Color> colors;
  final VoidCallback onPressed;

  const _ContactButton({
    required this.colors,
    required this.onPressed,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        scale: _hovered ? 1.035 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.colors,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: widget.colors.first.withValues(
                  alpha: _hovered ? .30 : .14,
                ),
                blurRadius: _hovered ? 28 : 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onPressed,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'LET\'S TALK',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .8,
                      ),
                    ),
                    const SizedBox(width: 12),
                    AnimatedSlide(
                      duration: const Duration(
                        milliseconds: 180,
                      ),
                      offset: _hovered ? const Offset(.18, 0) : Offset.zero,
                      child: const Icon(
                        Icons.arrow_outward_rounded,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
