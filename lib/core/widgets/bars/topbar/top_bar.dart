import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/widgets/bars/topbar/top_bar_button.dart';
import 'package:ramajana05/core/widgets/bars/topbar/top_bar_mobile_button.dart';
import 'package:ramajana05/core/widgets/language_switcher/language_pop_menu.dart';

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
  Size get preferredSize => const Size.fromHeight(72);
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  late final AnimationController _introController;

  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  bool _isScrolled = false;

  Timer? _colorTimer;

  int _colorIndex = 0;

  static const List<Color> _nameColors = [
    Color(0xFFFF2D95), // Pink
    Color(0xFF8A2BE2), // Purple
    Color(0xFF00CFFF), // Blue
  ];

  @override
  void initState() {
    super.initState();

    _introController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    _colorTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        if (!mounted) return;

        setState(() {
          _colorIndex = (_colorIndex + 1) % _nameColors.length;
        });
      },
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.35, 0),
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
        0.1,
        1,
        curve: Curves.easeOut,
      ),
    );

    widget.scrollController?.addListener(_onScroll);

    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        if (mounted) {
          _introController.forward();
        }
      },
    );
  }

  void _onScroll() {
    final controller = widget.scrollController;

    if (controller == null || !controller.hasClients) {
      return;
    }

    final shouldBeScrolled = controller.offset > 70;

    if (shouldBeScrolled == _isScrolled) {
      return;
    }

    setState(() {
      _isScrolled = shouldBeScrolled;
    });
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: _isScrolled ? 14 : 0,
          sigmaY: _isScrolled ? 14 : 0,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor.withValues(
              alpha: _isScrolled ? .92 : 1,
            ),
            border: Border(
              bottom: BorderSide(
                color: _isScrolled
                    ? colorScheme.onSurface.withValues(alpha: .08)
                    : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: 72,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 40,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: widget.onHomePressed,
                      behavior: HitTestBehavior.opaque,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: _buildName(context),
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (!isMobile) ..._buildDesktopActions(context),
                    if (isMobile) _buildMobileMenuButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final baseStyle = AppTextStyles.topBarTextButton(context).copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: 1.2,
      height: 1,
    );

    final currentColor = _nameColors[_colorIndex];

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        height: 44,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOutCubic,
              style: baseStyle.copyWith(
                color: colorScheme.onSurface,
              ),
              child: const Text(
                'RAMAJANA',
                maxLines: 1,
                softWrap: false,
              ),
            ),
            ClipRect(
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutCubic,
                alignment: Alignment.centerLeft,
                widthFactor: _isScrolled ? 0 : 1,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isScrolled ? 0 : 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeInOutCubic,
                      style: baseStyle.copyWith(
                        color: currentColor,
                      ),
                      child: const Text(
                        'SKOPLJAK',
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.only(
                left: _isScrolled ? 5 : 7,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeInOutCubic,
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: currentColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDesktopActions(BuildContext context) {
    return [
      TopBarButton(
        text: context.l10n.home,
        onPressed: widget.onHomePressed,
      ),
      const SizedBox(width: 6),
      TopBarButton(
        text: context.l10n.projects,
        onPressed: widget.onProjectPressed,
      ),
      const SizedBox(width: 6),
      TopBarButton(
        text: context.l10n.contact,
        onPressed: widget.onContactPressed,
      ),
      const SizedBox(width: 18),
      Container(
        width: 1,
        height: 22,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .10),
      ),
      const SizedBox(width: 18),
      const LanguagePopupMenu(),
    ];
  }

  Widget _buildMobileMenuButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showMenu(context),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorScheme.onSurface.withValues(
                alpha: .10,
              ),
            ),
          ),
          child: Icon(
            Icons.menu_rounded,
            size: 23,
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: .55),
      isScrollControlled: true,
      builder: (sheetContext) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            border: Border(
              top: BorderSide(
                color: colorScheme.onSurface.withValues(
                  alpha: .08,
                ),
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                12,
                24,
                28,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 42,
                      height: 4,
                      decoration: BoxDecoration(
                        color: colorScheme.onSurface.withValues(
                          alpha: .18,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'NAVIGATION',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TopBarMobileButton(
                    text: context.l10n.home,
                    icon: Icons.home_outlined,
                    onPressed: widget.onHomePressed,
                  ),
                  TopBarMobileButton(
                    text: context.l10n.projects,
                    icon: Icons.grid_view_rounded,
                    onPressed: widget.onProjectPressed,
                  ),
                  TopBarMobileButton(
                    text: context.l10n.contact,
                    icon: Icons.mail_outline_rounded,
                    onPressed: widget.onContactPressed,
                  ),
                  const SizedBox(height: 22),
                  Divider(
                    color: colorScheme.onSurface.withValues(
                      alpha: .08,
                    ),
                    height: 1,
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Text(
                        'LANGUAGE',
                        style: TextStyle(
                          color: colorScheme.onSurface.withValues(
                            alpha: .45,
                          ),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.6,
                        ),
                      ),
                      const Spacer(),
                      const LanguagePopupMenu(),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Divider(
                    color: colorScheme.onSurface.withValues(alpha: .08),
                    height: 1,
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'AVAILABLE FOR OPPORTUNITIES',
                        style: TextStyle(
                          color: colorScheme.onSurface.withValues(alpha: .55),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Stuttgart, Germany',
                    style: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: .35),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _MobileSocialLink(
                        label: 'GITHUB',
                        onTap: () {
                          // TODO: open GitHub
                        },
                      ),
                      const SizedBox(width: 24),
                      _MobileSocialLink(
                        label: 'LINKEDIN',
                        onTap: () {
                          // TODO: open LinkedIn
                        },
                      ),
                    ],
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

class _MobileSocialLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;

  const _MobileSocialLink({
    required this.label,
    required this.onTap,
    this.icon,
  });

  @override
  State<_MobileSocialLink> createState() => _MobileSocialLinkState();
}

class _MobileSocialLinkState extends State<_MobileSocialLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          color: _isHovered
              ? colorScheme.primary.withValues(alpha: .06)
              : colorScheme.onSurface.withValues(alpha: .025),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: _isHovered
                ? colorScheme.primary.withValues(alpha: .28)
                : colorScheme.onSurface.withValues(alpha: .08),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(9),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(
                          alpha: _isHovered ? .12 : .07,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        widget.icon,
                        size: 14,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 180),
                    style: TextStyle(
                      color: _isHovered
                          ? colorScheme.onSurface
                          : colorScheme.onSurface.withValues(alpha: .60),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                    child: Text(widget.label),
                  ),
                  const SizedBox(width: 9),
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOutCubic,
                    offset: _isHovered ? const Offset(.12, -.12) : Offset.zero,
                    child: Icon(
                      Icons.north_east_rounded,
                      size: 14,
                      color: _isHovered
                          ? colorScheme.primary
                          : colorScheme.onSurface.withValues(alpha: .30),
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
