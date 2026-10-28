
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';

class HomeCTASection extends StatefulWidget {
  const HomeCTASection({super.key});

  @override
  State<HomeCTASection> createState() => _HomeCTASectionState();
}

class _HomeCTASectionState extends State<HomeCTASection> {
  static const _slideDuration = Duration(milliseconds: 3500);
  static const _fadeDuration = Duration(milliseconds: 250);

  static const List<List<Color>> _gradients = [
    [Color(0xFFFF2D95), Color(0xFF8A2BE2)],
    [Color(0xFF8A2BE2), Color(0xFF00CFFF)],
    [Color(0xFF00CFFF), Color(0xFF35E6A5)],
    [
      Color(0xFFFF2D95),
      Color(0xFF8A2BE2),
      Color(0xFF00CFFF),
    ],
  ];

  int _currentIndex = 0;
  bool _visible = true;
  Timer? _timer;
  Timer? _fadeTimer;

  List<String> _words(BuildContext context) => [
        context.l10n.memorable.toUpperCase(),
        context.l10n.beautiful.toUpperCase(),
        context.l10n.useful.toUpperCase(),
        context.l10n.yours.toUpperCase(),
      ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    if (MediaQuery.disableAnimationsOf(context)) return;

    _timer = Timer.periodic(_slideDuration, (_) {
      _changeSlide((_currentIndex + 1) % _gradients.length);
    });
  }

  void _changeSlide(int index) {
    if (!mounted || index == _currentIndex) return;

    _fadeTimer?.cancel();

    if (MediaQuery.disableAnimationsOf(context)) {
      setState(() => _currentIndex = index);
      return;
    }

    setState(() => _visible = false);

    _fadeTimer = Timer(_fadeDuration, () {
      if (!mounted) return;

      setState(() {
        _currentIndex = index;
        _visible = true;
      });
    });
  }

  void _selectSlide(int index) {
    _changeSlide(index);
    _timer?.cancel();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _fadeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final words = _words(context);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 700;
        final isCompact = width < 420;

        final titleSize = isCompact
            ? 30.0
            : isMobile
                ? 38.0
                : width < 1100
                    ? 52.0
                    : 64.0;

        final wordSize = isCompact
            ? 38.0
            : isMobile
                ? 46.0
                : width < 1100
                    ? 60.0
                    : 76.0;

        final gradientColors = _gradients[_currentIndex];

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 64,
            vertical: isMobile ? 65 : 90,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // EYEBROW
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 24,
                        height: 1,
                        color: gradientColors.first,
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          context.l10n.haveAnIdea.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colorScheme.onSurface.withValues(
                              alpha: 0.55,
                            ),
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 24,
                        height: 1,
                        color: gradientColors.last,
                      ),
                    ],
                  ),

                  SizedBox(height: isMobile ? 30 : 42),

                  // STATIC HEADING
                  Text(
                    context.l10n.letsBuildSomething.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: titleSize,
                      height: 1.08,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.5,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ANIMATED GRADIENT WORD
                  RepaintBoundary(
                    child: AnimatedOpacity(
                      opacity: _visible ? 1 : 0,
                      duration: reduceMotion
                          ? Duration.zero
                          : _fadeDuration,
                      curve: Curves.easeInOut,
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: gradientColors,
                          ).createShader(bounds);
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            words[_currentIndex],
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: wordSize,
                              height: 1.05,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: isMobile ? 28 : 36),

                  // DESCRIPTION
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 570,
                    ),
                    child: Text(
                      context.l10n.haveAProjectIdea,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorScheme.onSurface.withValues(
                          alpha: 0.62,
                        ),
                        fontSize: isMobile ? 14 : 16,
                        height: 1.7,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // SLIDE INDICATORS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _gradients.length,
                      (index) {
                        final active = index == _currentIndex;

                        return Tooltip(
                          message: words[index],
                          child: InkWell(
                            onTap: () => _selectSlide(index),
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 10,
                              ),
                              child: Container(
                                width: active ? 30 : 7,
                                height: 6,
                                decoration: BoxDecoration(
                                  gradient: active
                                      ? LinearGradient(
                                          colors: gradientColors,
                                        )
                                      : null,
                                  color: active
                                      ? null
                                      : colorScheme.onSurface.withValues(
                                          alpha: 0.20,
                                        ),
                                  borderRadius:
                                      BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
