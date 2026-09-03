import 'package:flutter/material.dart';

import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/main.dart';

class LanguagePopupMenu extends StatefulWidget {
  const LanguagePopupMenu({
    super.key,
  });

  @override
  State<LanguagePopupMenu> createState() => _LanguagePopupMenuState();
}

class _LanguagePopupMenuState extends State<LanguagePopupMenu>
    with WidgetsBindingObserver {
  final MenuController _menuController = MenuController();

  Size? _lastSize;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _lastSize = MediaQuery.sizeOf(context);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final newSize = MediaQuery.sizeOf(context);

      if (_lastSize != newSize) {
        _lastSize = newSize;

        if (_menuController.isOpen) {
          _menuController.close();
        }
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    if (_menuController.isOpen) {
      _menuController.close();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return MenuAnchor(
      controller: _menuController,

      alignmentOffset: const Offset(
        -120,
        10,
      ),

      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          colorScheme.surface,
        ),
        surfaceTintColor: const WidgetStatePropertyAll(
          Colors.transparent,
        ),
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.all(6),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: colorScheme.onSurface.withValues(
                alpha: .08,
              ),
            ),
          ),
        ),
      ),

      // =========================================================
      // DROPDOWN CONTENT
      // =========================================================

      menuChildren: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            14,
            10,
            14,
            7,
          ),
          child: SizedBox(
            width: 150,
            child: Text(
              'LANGUAGE',
              style: TextStyle(
                color: colorScheme.onSurface.withValues(
                  alpha: .35,
                ),
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.8,
              ),
            ),
          ),
        ),
        _LanguageMenuItem(
          code: 'DE',
          name: context.l10n.german,
          active: !isEnglish,
          onPressed: () {
            _changeLanguage(
              context,
              'de',
            );
          },
        ),
        _LanguageMenuItem(
          code: 'EN',
          name: 'English',
          active: isEnglish,
          onPressed: () {
            _changeLanguage(
              context,
              'en',
            );
          },
        ),
      ],

      // =========================================================
      // ORIGINAL BUTTON
      // =========================================================

      builder: (
        context,
        controller,
        child,
      ) {
        return InkWell(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          borderRadius: BorderRadius.circular(6),
          child: Padding(
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
        );
      },
    );
  }

  void _changeLanguage(
    BuildContext context,
    String languageCode,
  ) {
    _menuController.close();

    MyApp.setLocale(
      context,
      Locale(languageCode),
    );
  }
}

// =============================================================
// LANGUAGE MENU ITEM
// =============================================================

class _LanguageMenuItem extends StatelessWidget {
  final String code;
  final String name;
  final bool active;
  final VoidCallback onPressed;

  const _LanguageMenuItem({
    required this.code,
    required this.name,
    required this.active,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MenuItemButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.zero,
        ),
        overlayColor: WidgetStatePropertyAll(
          colorScheme.primary.withValues(
            alpha: .05,
          ),
        ),
      ),
      child: Container(
        width: 170,
        height: 44,
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: active
              ? colorScheme.primary.withValues(
                  alpha: .07,
                )
              : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Text(
                code,
                style: TextStyle(
                  color: active
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(
                          alpha: .35,
                        ),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  color: active
                      ? colorScheme.onSurface
                      : colorScheme.onSurface.withValues(
                          alpha: .65,
                        ),
                  fontSize: 13,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            if (active)
              Icon(
                Icons.check_rounded,
                size: 16,
                color: colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}
