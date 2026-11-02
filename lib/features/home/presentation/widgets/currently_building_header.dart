import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/divider/accent_divider.dart';
import 'package:ramajana05/core/widgets/text/eyebrow_text.dart';

class CurrentlyBuildingHeader extends StatefulWidget {
  const CurrentlyBuildingHeader({super.key});

  @override
  State<CurrentlyBuildingHeader> createState() =>
      _CurrentlyBuildingHeaderState();
}

class _CurrentlyBuildingHeaderState extends State<CurrentlyBuildingHeader>
    with TickerProviderStateMixin {
  late final AnimationController _reveal;
  late final AnimationController _ambient;

  static const _mint = Color(0xFF55CBA3);
  static const _blue = Color(0xFF6B9EFF);

  @override
  void initState() {
    super.initState();

    _reveal = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    );

    _ambient = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (MediaQuery.disableAnimationsOf(context)) {
      _reveal.value = 1;
      _ambient.stop();
      _ambient.value = 1;
    } else {
      if (_reveal.value == 0) {
        _reveal.forward();
      }

      if (!_ambient.isAnimating) {
        _ambient.repeat(reverse: true);
      }
    }
  }

  @override
  void dispose() {
    _reveal.dispose();
    _ambient.dispose();
    super.dispose();
  }

  Widget _entrance({
    required double start,
    required Widget child,
  }) {
    final animation = _reveal.drive(
      CurveTween(
        curve: Interval(
          start,
          1,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.16),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;
    final mobile = MediaQuery.sizeOf(context).width < 600;

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EyebrowText(
            number: '02',
            text: 'CURRENTLY BUILDING',
          ),
          const SizedBox(height: 24),
          const AccentDivider(
            accentColor: _blue,
          ),
          const SizedBox(height: 24),
          _entrance(
            start: 0.12,
            child: Text(
              'Ideas taking shape.',
              style: TextStyle(
                color: foreground,
                fontSize: mobile ? 32 : 46,
                height: 1.15,
                fontWeight: FontWeight.w800,
                letterSpacing: -1.2,
              ),
            ),
          ),
          const SizedBox(height: 6),
          _entrance(
            start: 0.22,
            child: Text(
              'One commit at a time.',
              style: TextStyle(
                color: _blue,
                fontSize: mobile ? 24 : 36,
                height: 1.2,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
