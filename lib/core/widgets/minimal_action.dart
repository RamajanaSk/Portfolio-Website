import 'package:flutter/material.dart';

class MinimalAction extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MinimalAction({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<MinimalAction> createState() => _MinimalActionState();
}

class _MinimalActionState extends State<MinimalAction> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.identity()..translate(0.0, hovered ? -2 : 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                child: Icon(
                  widget.icon,
                  size: 18,
                  color: hovered
                      ? const Color(0xFF00CFFF)
                      : Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(width: 10),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                  color:
                      hovered ? Colors.white : Colors.white.withOpacity(0.72),
                ),
                child: Text(widget.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
