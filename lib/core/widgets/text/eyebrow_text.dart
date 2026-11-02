import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';

class EyebrowText extends StatefulWidget {
  final String number;
  final String text;

  const EyebrowText({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  State<EyebrowText> createState() => _EyebrowTextState();
}

class _EyebrowTextState extends State<EyebrowText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _numberReveal;
  late final Animation<double> _dividerReveal;
  late final Animation<double> _textReveal;

  Color get _accent {
    switch (int.tryParse(widget.number)) {
      case 1:
        return const Color(0xFFED81B0); // Pink
      case 2:
        return const Color(0xFF6B9EFF); // Blau
      case 3:
        return const Color(0xFFAD8BF5); // Lila
      case 4:
        return const Color(0xFF55CBA3); // Grün
      case 5:
        return const Color(0xFFE5AD66); // Orange
      default:
        return const Color(0xFF6B9EFF);
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    _numberReveal = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0,
        0.65,
        curve: Curves.easeOutCubic,
      ),
    );

    _dividerReveal = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.12,
        0.8,
        curve: Curves.easeOutCubic,
      ),
    );

    _textReveal = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.22,
        1,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
    } else if (_controller.value == 0) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _reveal({
    required Animation<double> animation,
    required Widget child,
  }) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;
    final style = AppTextStyles.description(context);

    return Semantics(
      label: '${widget.number}, ${widget.text}',
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _reveal(
            animation: _numberReveal,
            child: Text(
              widget.number,
              style: style.copyWith(
                color: _accent,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 12),
          FadeTransition(
            opacity: _dividerReveal,
            child: SizeTransition(
              sizeFactor: _dividerReveal,
              axis: Axis.vertical,
              axisAlignment: 0,
              child: Container(
                width: 1,
                height: 18,
                color: foreground.withValues(alpha: 0.25),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: _reveal(
              animation: _textReveal,
              child: Text(
                widget.text,
                style: style.copyWith(
                  color: foreground.withValues(alpha: 0.55),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
