import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/utils/platform_link.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String catchPhrase;
  final String hexColor;
  final String? previewImage;
  final List<PlatformLink> platformLinks;
  final String date;
  final String? githubUrl;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.catchPhrase,
    required this.hexColor,
    required this.previewImage,
    required this.platformLinks,
    required this.date,
    required this.onTap,
    this.githubUrl,
  });

  Color get _accent {
    final hex = hexColor.trim().replaceFirst('#', '');
    final normalized = hex.length == 6 ? 'FF$hex' : hex;

    return Color(
      int.tryParse(normalized, radix: 16) ?? 0xFF6B9EFF,
    );
  }

  Future<void> _openLink(BuildContext context, String url) async {
    final uri = Uri.tryParse(url.trim());

    if (uri == null || !uri.hasScheme) return;

    try {
      final opened = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!opened && context.mounted) {
        _showLinkError(context);
      }
    } catch (_) {
      if (context.mounted) {
        _showLinkError(context);
      }
    }
  }

  void _showLinkError(BuildContext context) {
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      const SnackBar(
        content: Text('Could not open this link.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = theme.colorScheme.onSurface;
    final accent = _accent;

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 560;

        return Material(
          color: Color.alphaBlend(
            foreground.withValues(alpha: 0.025),
            theme.scaffoldBackgroundColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: foreground.withValues(alpha: 0.08),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            hoverColor: accent.withValues(alpha: 0.025),
            splashColor: accent.withValues(alpha: 0.08),
            highlightColor: accent.withValues(alpha: 0.035),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 20,
              ),
              child: compact
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildPreview(context, accent),
                        const SizedBox(height: 16),
                        _buildContent(
                          context,
                          accent: accent,
                          compact: true,
                        ),
                      ],
                    )
                  : IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 5,
                            child: _buildContent(
                              context,
                              accent: accent,
                              compact: false,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 6,
                            child: _buildPreview(context, accent),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required Color accent,
    required bool compact,
  }) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 6 : 12,
      ),
      child: Column(
        mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 22,
                height: 3,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              if (date.trim().isNotEmpty) ...[
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    date,
                    style: TextStyle(
                      color: foreground.withValues(alpha: 0.5),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.titleProjectCard(context).copyWith(
              color: foreground,
              fontWeight: FontWeight.w800,
              height: 1.15,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            catchPhrase,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.description(context).copyWith(
              color: foreground.withValues(alpha: 0.6),
              height: 1.7,
            ),
          ),
          if (!compact) const Spacer(),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: platformLinks.map((link) {
                    return _buildPlatformLink(
                      context,
                      icon: link.icon,
                      url: link.url,
                      tooltip: link.tooltip,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 12),
              ExcludeSemantics(
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(
                    Icons.arrow_outward_rounded,
                    color: accent,
                    size: 19,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPreview(BuildContext context, Color accent) {
    final foreground = Theme.of(context).colorScheme.onSurface;
    final hasImage = previewImage?.trim().isNotEmpty ?? false;
    final hasGithub = githubUrl?.trim().isNotEmpty ?? false;

    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.06),
              ),
              child: hasImage
                  ? Image.asset(
                      previewImage!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildImageFallback(context, accent);
                      },
                    )
                  : _buildImageFallback(context, accent),
            ),
            if (hasGithub)
              Positioned(
                top: 10,
                right: 10,
                child: Material(
                  color: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(11),
                  clipBehavior: Clip.antiAlias,
                  child: IconButton(
                    onPressed: () => _openLink(context, githubUrl!),
                    tooltip: 'View on GitHub',
                    constraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                    padding: const EdgeInsets.all(10),
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      color: foreground,
                      size: 18,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageFallback(BuildContext context, Color accent) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.layers_outlined,
            size: 36,
            color: accent.withValues(alpha: 0.65),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: foreground.withValues(alpha: 0.5),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformLink(
    BuildContext context, {
    required Object icon,
    required String url,
    required String tooltip,
  }) {
    final foreground = Theme.of(context).colorScheme.onSurface;
    final enabled = url.trim().isNotEmpty;

    return Tooltip(
      message: tooltip,
      child: Semantics(
        label: tooltip,
        button: true,
        enabled: enabled,
        child: Ink(
          decoration: BoxDecoration(
            color: foreground.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: foreground.withValues(alpha: 0.06),
            ),
          ),
          child: InkWell(
            onTap: enabled ? () => _openLink(context, url) : null,
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 36,
              height: 36,
              child: Center(
                child: Opacity(
                  opacity: enabled ? 0.8 : 0.3,
                  child: PlatformLink.buildIcon(
                    icon,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
