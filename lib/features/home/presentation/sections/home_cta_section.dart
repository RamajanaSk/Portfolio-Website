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
    [
      Color(0xFFFF2D95),
      Color(0xFF8A2BE2),
    ],
    [
      Color(0xFF8A2BE2),
      Color(0xFF00CFFF),
    ],
    [
      Color(0xFF00CFFF),
      Color(0xFF35E6A5),
    ],
    [
      Color(0xFFFF2D95),
      Color(0xFF8A2BE2),
      Color(0xFF00CFFF),
    ],
  ];

  int _currentIndex = 0;
  bool _visible = true;
  bool _reduceMotion = false;

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

    _reduceMotion = MediaQuery.disableAnimationsOf(context);

    if (_reduceMotion) {
      _timer?.cancel();
      _fadeTimer?.cancel();
      _visible = true;
    } else {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer?.cancel();

    if (_reduceMotion) return;

    _timer = Timer.periodic(_slideDuration, (_) {
      _changeSlide((_currentIndex + 1) % _gradients.length);
    });
  }

  void _changeSlide(int index) {
    if (!mounted) return;

    _fadeTimer?.cancel();

    if (_reduceMotion || index == _currentIndex) {
      setState(() {
        _currentIndex = index;
        _visible = true;
      });
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
    final gradientColors = _gradients[_currentIndex];

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 700;

        // Small outer margins, no maximum content width.
        final horizontalPadding = mobile ? 16.0 : 24.0;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: mobile ? 72 : 110,
          ),
          child: LayoutBuilder(
            builder: (context, inner) {
              final width = inner.maxWidth;

              final titleSize = (width * 0.062).clamp(34.0, 104.0).toDouble();

              final wordSize = (width * 0.09).clamp(44.0, 148.0).toDouble();

              final titleStyle = TextStyle(
                color: colorScheme.onSurface,
                fontSize: titleSize,
                height: 1.08,
                fontWeight: FontWeight.w900,
                letterSpacing: mobile ? -0.8 : -2,
              );

              final wordStyle = TextStyle(
                color: Colors.white,
                fontSize: wordSize,
                height: 1.08,
                fontWeight: FontWeight.w900,
                letterSpacing: mobile ? -1 : -3,
              );

              // Measure every word so changing slides does not
              // shift the description and indicators vertically.
              var wordHeight = 0.0;

              for (final word in words) {
                final painter = TextPainter(
                  text: TextSpan(
                    text: word,
                    style: wordStyle,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: Directionality.of(context),
                  textScaler: MediaQuery.textScalerOf(context),
                  locale: Localizations.localeOf(context),
                )..layout(maxWidth: width);

                if (painter.height > wordHeight) {
                  wordHeight = painter.height;
                }

                painter.dispose();
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: mobile ? 20 : 40,
                        height: 2,
                        color: gradientColors.first,
                      ),
                      const SizedBox(width: 14),
                      Flexible(
                        child: Text(
                          context.l10n.haveAnIdea.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colorScheme.onSurface.withValues(
                              alpha: 0.65,
                            ),
                            fontSize: mobile ? 12 : 14,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2.5,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Container(
                        width: mobile ? 20 : 40,
                        height: 2,
                        color: gradientColors.last,
                      ),
                    ],
                  ),
                  SizedBox(height: mobile ? 32 : 48),

                  // Large heading, free to wrap.
                  Text(
                    context.l10n.letsBuildSomething.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: titleStyle,
                  ),
                  SizedBox(height: mobile ? 12 : 18),

                  // Only this part fades.
                  RepaintBoundary(
                    child: SizedBox(
                      height: wordHeight.ceilToDouble() + 4,
                      child: Center(
                        child: AnimatedOpacity(
                          opacity: _visible ? 1 : 0,
                          duration:
                              _reduceMotion ? Duration.zero : _fadeDuration,
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
                                style: wordStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mobile ? 28 : 40),

                  // Keep the paragraph readable despite
                  // the full-width headline.
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 760,
                      ),
                      child: Text(
                        context.l10n.haveAProjectIdea,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                          fontSize: mobile ? 16 : 20,
                          height: 1.75,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mobile ? 24 : 32),

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 4,
                    children: List.generate(
                      _gradients.length,
                      (index) {
                        final active = index == _currentIndex;

                        return Semantics(
                          selected: active,
                          child: Tooltip(
                            message: words[index],
                            child: InkWell(
                              onTap: () => _selectSlide(index),
                              borderRadius: BorderRadius.circular(24),
                              child: SizedBox(
                                width: 48,
                                height: 48,
                                child: Center(
                                  child: Container(
                                    width: active ? 36 : 9,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      gradient: active
                                          ? LinearGradient(
                                              colors: gradientColors,
                                            )
                                          : null,
                                      color: active
                                          ? null
                                          : colorScheme.onSurface
                                              .withValues(alpha: 0.22),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
