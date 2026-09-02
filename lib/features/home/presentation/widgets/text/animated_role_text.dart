import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/text/glitch_text.dart';

class AnimatedRoleText extends StatelessWidget {
  final bool showCreative;

  const AnimatedRoleText({
    super.key,
    required this.showCreative,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.role(context);

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'MOBILE DEVELOPER',
            style: style,
          ),
          const SizedBox(width: 20),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              final slideAnimation = Tween<Offset>(
                begin: const Offset(-0.15, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                ),
              );

              final scaleAnimation = Tween<double>(
                begin: 0.92,
                end: 1,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutBack,
                ),
              );

              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: slideAnimation,
                  child: ScaleTransition(
                    scale: scaleAnimation,
                    child: child,
                  ),
                ),
              );
            },
            child: showCreative
                ? GlitchText(
                    key: const ValueKey('creative'),
                    style: style,
                    text: 'CREATIVE',
                  )
                : const SizedBox(
                    key: ValueKey('creative-hidden'),
                  ),
          ),
        ],
      ),
    );
  }
}
