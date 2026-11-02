import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project.dart';

class CompactFeaturedProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback onTap;

  const CompactFeaturedProjectCard({
    required this.project,
    required this.onTap,
  });

  Color get _accent {
    final hex = project.hexcolor.trim().replaceFirst('#', '');
    final normalized = hex.length == 6 ? 'FF$hex' : hex;

    return Color(
      int.tryParse(normalized, radix: 16) ?? 0xFF6B9EFF,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = theme.colorScheme.onSurface;
    final accent = _accent;

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 460;

        return Material(
          color: Color.alphaBlend(
            foreground.withValues(alpha: 0.025),
            theme.colorScheme.surface,
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
            hoverColor: accent.withValues(alpha: 0.04),
            splashColor: accent.withValues(alpha: 0.08),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: compact
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildPreview(accent),
                        const SizedBox(height: 14),
                        _buildInformation(context, accent),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          child: _buildPreview(accent),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: _buildInformation(
                            context,
                            accent,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPreview(Color accent) {
    final hasImage = project.previewPicture?.trim().isNotEmpty ?? false;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: ColoredBox(
          color: accent.withValues(alpha: 0.08),
          child: hasImage
              ? Image.asset(
                  project.previewPicture!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildFallback(accent);
                  },
                )
              : _buildFallback(accent),
        ),
      ),
    );
  }

  Widget _buildFallback(Color accent) {
    return Center(
      child: Icon(
        Icons.layers_outlined,
        color: accent.withValues(alpha: 0.8),
        size: 32,
      ),
    );
  }

  Widget _buildInformation(
    BuildContext context,
    Color accent,
  ) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 3,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${project.startDate.year}',
              style: TextStyle(
                color: foreground.withValues(alpha: 0.5),
                fontSize: 11,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          project.name.toUpperCase(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: foreground,
            fontSize: 19,
            fontWeight: FontWeight.w800,
            height: 1.2,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          project.catchPhrase,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: foreground.withValues(alpha: 0.6),
            fontSize: 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.arrow_outward_rounded,
              color: accent,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
