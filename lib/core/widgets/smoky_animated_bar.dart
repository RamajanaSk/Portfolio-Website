import 'package:flutter/material.dart';

class SmokyAnimatedBar extends StatefulWidget {
  final double height;

  const SmokyAnimatedBar({Key? key, this.height = 8.0}) : super(key: key);

  @override
  State<SmokyAnimatedBar> createState() => _SmokyAnimatedBarState();
}

class _SmokyAnimatedBarState extends State<SmokyAnimatedBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _animation = ColorTween(
      begin: const Color.fromARGB(255, 255, 15, 159),
      end: Colors.blue.withOpacity(0.5),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 255, 15, 159),
                  _animation.value ?? const Color.fromARGB(255, 33, 26, 255)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        );
      },
    );
  }
}
