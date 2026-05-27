import 'package:flutter/material.dart';
import 'package:ramajana05/core/widgets/smoky_animated_bar.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onHomePressed;
  final VoidCallback? onAboutMePressed;
  final VoidCallback? onProjectPressed;
  final VoidCallback? onContactPressed;
  final bool isDropdownVisible;

  TopBar({
    Key? key,
    required this.title,
    this.onBack,
    this.onHomePressed,
    this.onAboutMePressed,
    this.onProjectPressed,
    this.onContactPressed,
    required this.isDropdownVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isScreenSmall = MediaQuery.of(context).size.width < 650;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: GestureDetector(
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      actions: [
        if (!isScreenSmall) ..._buildAppBarActions(context),
        if (isScreenSmall)
          IconButton(
            icon: Icon(Icons.menu, size: 30),
            onPressed: () => _showMenu(context),
          ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4.0),
        child: Column(children: [SmokyAnimatedBar(height: 8.0)]),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(68.0);

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      _buildHomeButton(context),
      SizedBox(width: 10),
      _buildAboutMeButton(context),
      SizedBox(width: 10),
      _buildProjectButtonNormal(context),
      SizedBox(width: 10),
      _buildContactButtonNormal(context),
      SizedBox(width: 10),
    ];
  }

  Widget _buildHomeButton(BuildContext context) => TextButton(
        onPressed: onHomePressed,
        child: Text('HOME',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
      );

  Widget _buildAboutMeButton(BuildContext context) => TextButton(
        onPressed: onAboutMePressed,
        child: Text('ABOUT',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
      );

  Widget _buildProjectButtonNormal(BuildContext context) => TextButton(
        onPressed: onProjectPressed,
        child: Text('PROJECT',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
      );

  Widget _buildContactButtonNormal(BuildContext context) => TextButton(
        onPressed: onContactPressed,
        child: Text('CONTACT',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
      );

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: _buildAppBarActions(context),
        );
      },
    );
  }
}
