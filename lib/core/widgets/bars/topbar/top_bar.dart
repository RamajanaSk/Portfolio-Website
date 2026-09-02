import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/bars/topbar/top_bar_button.dart';
import 'package:ramajana05/core/widgets/bars/topbar/top_bar_mobile_button.dart';
import 'package:ramajana05/core/widgets/language_switcher/language_pop_menu.dart';
import 'package:ramajana05/core/widgets/smoky_animated_bar.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
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

  // Pass the ScrollController of your page here
  final ScrollController? scrollController;

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
    this.scrollController,
  });

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(68);
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  late final AnimationController _introController;

  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();

    // =========================================================
    // INTRO ANIMATION
    // =========================================================

    _introController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.6, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _introController,
        curve: Curves.easeOutCubic,
      ),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _introController,
      curve: const Interval(
        0.15,
        1,
        curve: Curves.easeOut,
      ),
    );

    widget.scrollController?.addListener(_onScroll);

    // Small delay makes the entrance more intentional
    Future.delayed(
      const Duration(milliseconds: 150),
      () {
        if (mounted) {
          _introController.forward();
        }
      },
    );
  }

  // =========================================================
  // SCROLL
  // =========================================================

  void _onScroll() {
    final controller = widget.scrollController;

    if (controller == null || !controller.hasClients) {
      return;
    }

    final shouldBeScrolled = controller.offset > 80;

    if (shouldBeScrolled != _isScrolled) {
      setState(() {
        _isScrolled = shouldBeScrolled;
      });
    }
  }

  @override
  void didUpdateWidget(covariant TopBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController?.removeListener(_onScroll);
      widget.scrollController?.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    _introController.dispose();

    super.dispose();
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    final isScreenSmall = MediaQuery.of(context).size.width < 650;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,

      // =======================================================
      // ANIMATED NAME
      // =======================================================

      title: GestureDetector(
        onTap: widget.onHomePressed,
        child: SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: _buildAnimatedName(context),
          ),
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

  // =========================================================
  // ANIMATED NAME
  // =========================================================

  Widget _buildAnimatedName(BuildContext context) {
    final style = AppTextStyles.topBarTextButton(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'RAMAJANA',
          style: style,
        ),

        // SKOPLJAK smoothly disappears when scrolling
        AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          alignment: Alignment.centerLeft,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-0.25, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: _isScrolled
                ? const SizedBox(
                    key: ValueKey('hidden'),
                  )
                : Text(
                    ' SKOPLJAK',
                    key: const ValueKey('surname'),
                    style: style,
                  ),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // DESKTOP ACTIONS
  // =========================================================

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      TopBarButton(
        text: context.l10n.home,
        onPressed: widget.onHomePressed,
      ),
      const SizedBox(width: 10),
      TopBarButton(
        text: context.l10n.projects,
        onPressed: widget.onProjectPressed,
      ),
      const SizedBox(width: 10),
      TopBarButton(
        text: context.l10n.contact,
        onPressed: widget.onContactPressed,
      ),
      const SizedBox(width: 10),
      const LanguagePopupMenu(),
      const SizedBox(width: 20),
    ];
  }

  // =========================================================
  // MOBILE MENU
  // =========================================================

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
                onPressed: widget.onHomePressed,
              ),
              TopBarMobileButton(
                text: context.l10n.projects,
                onPressed: widget.onProjectPressed,
              ),
              TopBarMobileButton(
                text: context.l10n.contact,
                onPressed: widget.onContactPressed,
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
