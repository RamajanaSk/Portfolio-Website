import 'package:flutter/material.dart';

class FullWidthText extends StatelessWidget {
  final String text;

  const FullWidthText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 700;

    return SizedBox(
      width: double.infinity,
      height: isMobile ? 150 : 210,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: isMobile ? -25 : -45,
            child: IgnorePointer(
              child: Text(
                text.toUpperCase(),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: .025),
                  fontSize: isMobile ? 90 : 170,
                  height: 1,
                  fontWeight: FontWeight.w900,
                  letterSpacing: isMobile ? -3 : -7,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
