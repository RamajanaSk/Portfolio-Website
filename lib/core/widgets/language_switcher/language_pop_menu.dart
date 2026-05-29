import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/main.dart';

class LanguagePopupMenu extends StatelessWidget {
  const LanguagePopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return PopupMenuButton<String>(
      tooltip: 'Language',
      offset: const Offset(0, 45),
      color: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black.withOpacity(0.15),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      style: const ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          Colors.transparent,
        ),
        splashFactory: NoSplash.splashFactory,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        child: Text(
          isEnglish ? 'EN' : 'DE',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ),
      onSelected: (value) {
        if (value == 'de') {
          MyApp.setLocale(
            context,
            const Locale('de'),
          );
        } else {
          MyApp.setLocale(
            context,
            const Locale('en'),
          );
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'de',
          child: Row(
            children: [
              _buildIndicator(
                active: !isEnglish,
              ),
              const SizedBox(width: 12),
              Text(
                context.l10n.german,
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'en',
          child: Row(
            children: [
              _buildIndicator(
                active: isEnglish,
              ),
              const SizedBox(width: 12),
              Text(
                'English',
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator({
    required bool active,
  }) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? const Color(0xFF00CFFF) : Colors.transparent,
        border: Border.all(
          color: const Color(0xFF00CFFF),
        ),
      ),
    );
  }
}
