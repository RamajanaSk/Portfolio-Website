import 'package:flutter/material.dart';
import 'package:ramajana05/data/models/project_version.dart';
import 'package:ramajana05/features/projects/presentation/widget/version/version_selector.dart';

class VersionHistorySection extends StatefulWidget {
  final List<ProjectVersion> versions;

  const VersionHistorySection({
    super.key,
    required this.versions,
  });

  @override
  State<VersionHistorySection> createState() => _VersionHistorySectionState();
}

class _VersionHistorySectionState extends State<VersionHistorySection> {
  late ProjectVersion selectedVersion;

  @override
  void initState() {
    super.initState();

    selectedVersion = widget.versions.last;
  }

  void _selectVersion(ProjectVersion version) {
    setState(() {
      selectedVersion = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 850;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 64,
            vertical: isMobile ? 70 : 110,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 50),
              VersionSelector(
                versions: widget.versions,
                selectedVersion: selectedVersion,
                onSelected: _selectVersion,
              ),
              const SizedBox(height: 55),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: _VersionContent(
                  key: ValueKey(selectedVersion.version),
                  version: selectedVersion,
                  isMobile: isMobile,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 700,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'VERSION HISTORY',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Built, refined, evolved.',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Explore how the project evolved over time '
            'and what changed with each release.',
            style: TextStyle(
              fontSize: 18,
              height: 1.6,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _VersionContent extends StatelessWidget {
  final ProjectVersion version;
  final bool isMobile;

  const _VersionContent({
    super.key,
    required this.version,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _VersionInformation(version: version),
          const SizedBox(height: 50),
          _ScreenshotPreview(version: version),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: _VersionInformation(
            version: version,
          ),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 6,
          child: _ScreenshotPreview(
            version: version,
          ),
        ),
      ],
    );
  }
}

class _VersionInformation extends StatelessWidget {
  final ProjectVersion version;

  const _VersionInformation({
    required this.version,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                'v${version.version}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: colors.primary,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Text(
              version.date,
              style: TextStyle(
                fontSize: 14,
                color: colors.onSurface.withValues(
                  alpha: 0.5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          version.title,
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          version.description,
          style: TextStyle(
            fontSize: 17,
            height: 1.7,
            color: colors.onSurface.withValues(
              alpha: 0.65,
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'What changed',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: version.features.map((feature) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: colors.outlineVariant,
                ),
              ),
              child: Text(
                feature,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 40),
        _VersionMetaData(version: version),
      ],
    );
  }
}

class _VersionMetaData extends StatelessWidget {
  final ProjectVersion version;

  const _VersionMetaData({
    required this.version,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _MetaItem(
          title: 'Version',
          value: version.version,
        ),
        const SizedBox(width: 40),
        _MetaItem(
          title: 'Screens',
          value: version.screenshots.length.toString().padLeft(2, '0'),
        ),
        const SizedBox(width: 40),
        _MetaItem(
          title: 'Type',
          value: version.type,
        ),
      ],
    );
  }
}

class _MetaItem extends StatelessWidget {
  final String title;
  final String value;

  const _MetaItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ScreenshotPreview extends StatelessWidget {
  final ProjectVersion version;

  const _ScreenshotPreview({
    required this.version,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: colors.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quotey ${version.version}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Interface at this point in development',
                      style: TextStyle(
                        fontSize: 13,
                        color: colors.onSurface.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'UI Snapshot',
                style: TextStyle(
                  fontSize: 13,
                  color: colors.onSurface.withValues(
                    alpha: 0.45,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          if (version.screenshots.isEmpty)
            const SizedBox(
              height: 400,
              child: Center(
                child: Text('No screenshots'),
              ),
            )
          else
            _ScreenshotRow(
              screenshots: version.screenshots,
            ),
        ],
      ),
    );
  }
}

class _ScreenshotRow extends StatelessWidget {
  final List<String> screenshots;

  const _ScreenshotRow({
    required this.screenshots,
  });

  @override
  Widget build(BuildContext context) {
    final visibleScreenshots = screenshots.take(3).toList();

    return SizedBox(
      height: 470,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: visibleScreenshots.map((image) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Image.asset(
                image,
                height: 450,
                fit: BoxFit.contain,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
