import 'package:flutter/material.dart';
import 'package:ramajana05/core/utils/app_responsive.dart';

class ProjectCtaBackground extends StatelessWidget {
  final String projectName;
  final Color accent;
  final Widget child;

  const ProjectCtaBackground({
    super.key,
    required this.projectName,
    required this.accent,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final dividerInset = AppResponsive.fluidValue(
      context,
      min: 24,
      max: 80,
    );

    final projectNameTop = AppResponsive.fluidValue(
      context,
      min: 180,
      max: 160,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final glowInset = constraints.maxWidth * .25;

          return Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                left: 24,
                right: 24,
                top: projectNameTop,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: .025,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        projectName.toUpperCase(),
                        maxLines: 1,
                        style: TextStyle(
                          color: colors.onSurface,
                          fontSize: 180,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: glowInset,
                right: glowInset,
                bottom: -130,
                child: IgnorePointer(
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      boxShadow: [
                        BoxShadow(
                          color: accent.withValues(alpha: .15),
                          blurRadius: 130,
                          spreadRadius: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: dividerInset,
                right: dividerInset,
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        accent.withValues(alpha: .7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: child,
              ),
            ],
          );
        },
      ),
    );
  }
}
