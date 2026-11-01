import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/widgets/project_carousel.dart';
import 'package:ramajana05/core/widgets/text/eyebrow_text.dart';
import 'package:ramajana05/data/dummyData.dart';
import 'package:ramajana05/features/about/presentation/sections/tech_stack_section.dart';
import 'package:ramajana05/features/projects/ProjectDetailScreen.dart';

class FeaturedWorkAndTechnologiesSection extends StatelessWidget {
  const FeaturedWorkAndTechnologiesSection({super.key});

  static const _pink = Color(0xFFFF299D);
  static const _purple = Color(0xFFAE57F5);
  static const _cyan = Color(0xFF08BCEB);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = theme.colorScheme.onSurface;
    final projects = getDummyProjects(context);

    final headingStyle = TextStyle(
      color: foreground,
      fontWeight: FontWeight.w900,
      height: 1.16,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 20 : 32,
            vertical: mobile ? 36 : 64,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EyebrowText(
                    number: '03',
                    text: context.l10n.featuredProjects.toUpperCase(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'IDEAS INTO REALITY.',
                    textAlign: TextAlign.left,
                    style: headingStyle.copyWith(
                      fontSize: mobile ? 29 : 44,
                      letterSpacing: mobile ? 0.3 : 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ONE PROJECT AT A TIME.',
                    textAlign: TextAlign.right,
                    style: headingStyle.copyWith(
                      fontSize: mobile ? 29 : 44,
                      letterSpacing: mobile ? 0.3 : 1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'A selection of things I have built '
                    'and the technologies behind them.',
                    style: TextStyle(
                      color: foreground.withValues(alpha: 0.6),
                      fontSize: 13,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    height: 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [_pink, _purple, _cyan],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, inner) {
                      final stacked = inner.maxWidth < 1000;
                      final compact = inner.maxWidth < 600;

                      final projectPanel = _WorkPanel(
                        number: '01',
                        title: 'SELECTED WORK',
                        subtitle: 'Explore the ideas behind the interfaces.',
                        icon: Icons.layers_outlined,
                        accent: _pink,
                        panelHeight: stacked ? null : 600,
                        child: SizedBox(
                          height: stacked ? (compact ? 350 : 420) : null,
                          child: ProjectCarousel(
                            projects: projects,
                            onProjectTap: (project) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (detailContext) =>
                                      ProjectDetailScreen(
                                    project: project,
                                    onBack: () {
                                      Navigator.of(detailContext).pop();
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );

                      final techPanel = _WorkPanel(
                        number: '02',
                        title: 'THE TOOLKIT',
                        subtitle: 'Tools I use to bring ideas to life.',
                        icon: Icons.terminal_rounded,
                        accent: _cyan,
                        panelHeight: stacked ? null : 600,
                        scrollContent: !stacked,
                        child: const TechStackSection(),
                      );

                      if (stacked) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            projectPanel,
                            const SizedBox(height: 18),
                            techPanel,
                          ],
                        );
                      }

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: projectPanel,
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            flex: 4,
                            child: techPanel,
                          ),
                        ],
                      );
                    },
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

class _WorkPanel extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final Widget child;
  final double? panelHeight;
  final bool scrollContent;

  const _WorkPanel({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.child,
    this.panelHeight,
    this.scrollContent = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final foreground = theme.colorScheme.onSurface;

    final effectiveAccent =
        dark ? accent : Color.lerp(accent, Colors.black, 0.3)!;

    final header = Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$number / ',
                        style: TextStyle(
                          color: effectiveAccent,
                        ),
                      ),
                      TextSpan(text: title),
                    ],
                  ),
                  style: TextStyle(
                    color: foreground,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ExcludeSemantics(
                child: Icon(
                  icon,
                  size: 21,
                  color: effectiveAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              color: foreground.withValues(alpha: 0.55),
              fontSize: 12,
              height: 1.7,
            ),
          ),
        ],
      ),
    );

    final content = Padding(
      padding: const EdgeInsets.all(12),
      child: child,
    );

    final divider = Divider(
      height: 1,
      color: foreground.withValues(alpha: 0.08),
    );

    return Container(
      height: panelHeight,
      decoration: BoxDecoration(
        color: dark
            ? const Color(0xFF111114)
            : Color.alphaBlend(
                accent.withValues(alpha: 0.025),
                theme.colorScheme.surface,
              ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: foreground.withValues(alpha: 0.10),
        ),
      ),
      child: panelHeight == null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header,
                divider,
                content,
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Allows the header to scroll if text scaling
                // makes it unusually tall.
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: panelHeight! * 0.4,
                  ),
                  child: SingleChildScrollView(
                    primary: false,
                    child: header,
                  ),
                ),
                divider,
                Expanded(
                  child: scrollContent
                      ? SingleChildScrollView(
                          primary: false,
                          child: content,
                        )
                      : content,
                ),
              ],
            ),
    );
  }
}
