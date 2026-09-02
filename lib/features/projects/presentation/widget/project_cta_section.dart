import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/hexcolor.dart';
import 'package:ramajana05/data/models/project.dart';

class ProjectCTASection extends StatelessWidget {
  final Project project;
  final VoidCallback? onGithubPressed;
  final VoidCallback? onDemoPressed;

  const ProjectCTASection({
    super.key,
    required this.project,
    this.onGithubPressed,
    this.onDemoPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 700;

    final accent = project.hexcolor.toColor();

    return SizedBox(
      width: double.infinity,
      height: isMobile ? 500 : 560,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // =========================================================
            // BACKGROUND PROJECT NAME
            // =========================================================

            Positioned(
              left: 24,
              right: 24,
              top: isMobile ? 180 : 160,
              child: IgnorePointer(
                child: Opacity(
                  opacity: .025,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      project.name.toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 180,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -5,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // =========================================================
            // ACCENT GLOW
            // =========================================================

            Positioned(
              left: size.width * .25,
              right: size.width * .25,
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

            // =========================================================
            // TOP DIVIDER
            // =========================================================

            Positioned(
              top: 0,
              left: isMobile ? 24 : 80,
              right: isMobile ? 24 : 80,
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

            // =========================================================
            // CONTENT
            // =========================================================

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: isMobile ? 65 : 90,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 850,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // -------------------------------------------------
                      // LABEL
                      // -------------------------------------------------

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 24,
                            height: 1,
                            color: accent,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'TRY IT YOURSELF',
                            style: TextStyle(
                              color: accent,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 3,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 24,
                            height: 1,
                            color: accent,
                          ),
                        ],
                      ),

                      SizedBox(height: isMobile ? 26 : 32),

                      // -------------------------------------------------
                      // HEADING
                      // -------------------------------------------------

                      Text(
                        'Don\'t just read about it.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: isMobile ? 34 : 54,
                          height: 1.05,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.5,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Experience it.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: accent,
                          fontSize: isMobile ? 34 : 54,
                          height: 1.05,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.5,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // -------------------------------------------------
                      // DESCRIPTION
                      // -------------------------------------------------

                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 570,
                        ),
                        child: Text(
                          'Explore the code, try the project yourself, '
                          'or take a closer look at how it was built.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: .5),
                            fontSize: isMobile ? 14 : 16,
                            height: 1.7,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // -------------------------------------------------
                      // BUTTONS
                      // -------------------------------------------------

                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 14,
                        runSpacing: 14,
                        children: [
                          if (onDemoPressed != null)
                            _CTAButton(
                              text: 'TRY THE PROJECT',
                              icon: Icons.arrow_outward_rounded,
                              accent: accent,
                              filled: true,
                              onPressed: onDemoPressed!,
                            ),
                          if (onGithubPressed != null)
                            _CTAButton(
                              text: 'VIEW SOURCE',
                              icon: Icons.code_rounded,
                              accent: accent,
                              filled: false,
                              onPressed: onGithubPressed!,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CTAButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color accent;
  final bool filled;
  final VoidCallback onPressed;

  const _CTAButton({
    required this.text,
    required this.icon,
    required this.accent,
    required this.filled,
    required this.onPressed,
  });

  @override
  State<_CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<_CTAButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final foreground =
        widget.filled ? Colors.black : Theme.of(context).colorScheme.onSurface;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _hovered = true);
      },
      onExit: (_) {
        setState(() => _hovered = false);
      },
      child: AnimatedScale(
        scale: _hovered ? 1.025 : 1,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        child: Material(
          color: widget.filled
              ? widget.accent
              : (_hovered
                  ? Colors.white.withValues(alpha: .07)
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: widget.filled
                    ? null
                    : Border.all(
                        color: Colors.white.withValues(
                          alpha: _hovered ? .35 : .16,
                        ),
                      ),
                boxShadow: widget.filled
                    ? [
                        BoxShadow(
                          color: widget.accent.withValues(
                            alpha: _hovered ? .30 : .14,
                          ),
                          blurRadius: _hovered ? 26 : 16,
                          offset: const Offset(0, 7),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.icon,
                    size: 17,
                    color: foreground,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.text,
                    style: TextStyle(
                      color: foreground,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
