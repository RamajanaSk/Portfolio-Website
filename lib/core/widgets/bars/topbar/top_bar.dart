import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/bars/topbar/top_bar_button.dart';
import 'package:ramajana05/core/widgets/bars/topbar/top_bar_mobile_button.dart';
import 'package:ramajana05/core/widgets/language_switcher/language_pop_menu.dart';
import 'package:ramajana05/core/widgets/smoky_animated_bar.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final VoidCallback? onBack;
  final VoidCallback? onHomePressed;
  final VoidCallback? onAboutMePressed;
  final VoidCallback? onProjectPressed;
  final VoidCallback? onContactPressed;

  final VoidCallback? onGermanPressed;
  final VoidCallback? onEnglishPressed;

  final bool isDropdownVisible;
  final bool isEnglish;

  const TopBar({
    super.key,
    required this.title,
    this.onBack,
    this.onHomePressed,
    this.onAboutMePressed,
    this.onProjectPressed,
    this.onContactPressed,
    this.onGermanPressed,
    this.onEnglishPressed,
    required this.isDropdownVisible,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    final isScreenSmall = MediaQuery.of(context).size.width < 650;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: GestureDetector(
        onTap: onHomePressed,
        child: Text(
          title,
          style: AppTextStyles.topBarTextButton(context),
        ),
      ),
      actions: [
        if (!isScreenSmall) ..._buildAppBarActions(context),
        if (isScreenSmall)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () => _showMenu(context),
            ),
          ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(4),
        child: Column(
          children: [
            SmokyAnimatedBar(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      TopBarButton(
        text: context.l10n.home,
        onPressed: onHomePressed,
      ),
      /*const SizedBox(width: 10),
      TopBarButton(
        text: context.l10n.about,
        onPressed: onAboutMePressed,
      ),*/
      const SizedBox(width: 10),
      TopBarButton(
        text: context.l10n.projects,
        onPressed: onProjectPressed,
      ),
      const SizedBox(width: 10),
      TopBarButton(
        text: context.l10n.contact,
        onPressed: onContactPressed,
      ),
      const SizedBox(width: 10),
      const LanguagePopupMenu(),
      const SizedBox(width: 20),
    ];
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TopBarMobileButton(
                text: context.l10n.home,
                onPressed: onHomePressed,
              ),
              /* TopBarMobileButton(
                text: context.l10n.about,
                onPressed: onAboutMePressed,
              ), */
              TopBarMobileButton(
                text: context.l10n.projects,
                onPressed: onProjectPressed,
              ),
              TopBarMobileButton(
                text: context.l10n.contact,
                onPressed: onContactPressed,
              ),
              const SizedBox(height: 24),
              const LanguagePopupMenu(),
            ],
          ),
        );
      },
    );
  }
}
