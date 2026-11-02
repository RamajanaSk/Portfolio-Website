import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  List<_TechCategoryData> _categories(BuildContext context) {
    return [
      _TechCategoryData(
        title: context.l10n.programming,
        items: const [
          _TechLogo('Dart', 'dart/dart-original'),
          _TechLogo('C#', 'csharp/csharp-original'),
          _TechLogo('Java', 'java/java-original'),
          _TechLogo(
            'SQL',
            'azuresqldatabase/azuresqldatabase-original',
          ),
          _TechLogo('Kotlin', 'kotlin/kotlin-original'),
          _TechLogo('JavaScript', 'javascript/javascript-original'),
        ],
      ),
      _TechCategoryData(
        title: context.l10n.frameworks,
        items: const [
          _TechLogo('Flutter', 'flutter/flutter-original'),
          _TechLogo(
            'Unity',
            'unity/unity-original',
            monochrome: true,
          ),
          _TechLogo('Android SDK', 'android/android-original'),
        ],
      ),
      _TechCategoryData(
        title: context.l10n.databases,
        items: const [
          _TechLogo('MySQL', 'mysql/mysql-original'),
          _TechLogo('SQLite', 'sqlite/sqlite-original'),
          _TechLogo('PostgreSQL', 'postgresql/postgresql-original'),
        ],
      ),
      _TechCategoryData(
        title: context.l10n.tools,
        items: const [
          _TechLogo(
            'GitHub',
            'github/github-original',
            monochrome: true,
          ),
          _TechLogo('VS Code', 'vscode/vscode-original'),
          _TechLogo(
            'Android Studio',
            'androidstudio/androidstudio-original',
          ),
          _TechLogo('IntelliJ IDEA', 'intellij/intellij-original'),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;
    final categories = _categories(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var index = 0; index < categories.length; index++)
            Padding(
              padding: EdgeInsets.only(
                bottom: index == categories.length - 1 ? 0 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories[index].title,
                    style: AppTextStyles.description(context).copyWith(
                      color: foreground.withValues(alpha: 0.65),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: categories[index]
                        .items
                        .map((tech) => _TechLogoTile(tech: tech))
                        .toList(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _TechLogoTile extends StatelessWidget {
  final _TechLogo tech;

  const _TechLogoTile({required this.tech});

  static const _baseUrl =
      'https://cdn.jsdelivr.net/gh/devicons/devicon@v2.16.0/icons';

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Tooltip(
      message: tech.name,
      child: Semantics(
        label: tech.name,
        image: true,
        excludeSemantics: true,
        child: Container(
          width: 76,
          height: 76,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: foreground.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: foreground.withValues(alpha: 0.06),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 26,
                height: 26,
                child: SvgPicture.network(
                  '$_baseUrl/${tech.path}.svg',
                  fit: BoxFit.contain,
                  colorFilter: tech.monochrome
                      ? ColorFilter.mode(
                          foreground,
                          BlendMode.srcIn,
                        )
                      : null,
                  placeholderBuilder: (context) => Center(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: foreground.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                tech.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: foreground.withValues(alpha: 0.75),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechCategoryData {
  final String title;
  final List<_TechLogo> items;

  const _TechCategoryData({
    required this.title,
    required this.items,
  });
}

class _TechLogo {
  final String name;
  final String path;
  final bool monochrome;

  const _TechLogo(
    this.name,
    this.path, {
    this.monochrome = false,
  });
}
