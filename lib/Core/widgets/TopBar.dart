import 'package:flutter/material.dart';
import 'package:ramajana05/Screens/Portfolioscreen.dart';
import 'package:ramajana05/Core/widgets/SmokyAnimatedBar.dart';
import 'package:ramajana05/Core/theme/appColors.dart';
import 'package:url_launcher/url_launcher.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onHomePressed;
  final VoidCallback? onProjectPressed;
  final VoidCallback? onAboutMePressed;
  final VoidCallback? onPortfolioIconPressed;
  final bool isDropdownVisible; // Added to track dropdown visibility

  TopBar({
    Key? key,
    required this.title,
    this.onBack,
    this.onHomePressed,
    this.onAboutMePressed,
    this.onProjectPressed,
    this.onPortfolioIconPressed,
    required this.isDropdownVisible, // Ensure it's required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isScreenSmall = MediaQuery.of(context).size.width < 650;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
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
      _buildHomeButton(),
      SizedBox(width: 10),
      _buildAboutMeButton(),
      SizedBox(width: 10),
      _buildSkillButton(),
      SizedBox(width: 10),
      _buildExperienceButton(),
      SizedBox(width: 10),
      _buildProjectButton(context),
      SizedBox(width: 10),
    ];
  }

  Widget _buildHomeButton() => TextButton(
        onPressed: onHomePressed,
        child: Text('HOME',
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
      );

  Widget _buildAboutMeButton() => TextButton(
        onPressed: onAboutMePressed,
        child: Text('ABOUT ME',
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
      );

  Widget _buildProjectButton(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text button for Portfolio that navigates to the portfolio page
          TextButton(
            onPressed:
                onProjectPressed, // Action for the text (e.g., navigate to the portfolio page)
            child: Text(
              'PROJECTS',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),

          // Icon button for dropdown (toggles visibility)
          IconButton(
            icon: Icon(
              isDropdownVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 30,
              color: AppColors.black,
            ),
            onPressed: onPortfolioIconPressed,
          ),
        ],
      );

  Widget _buildSkillButton() => TextButton(
        onPressed: onAboutMePressed,
        child: Text('SKILLS',
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
      );

  Widget _buildExperienceButton() => TextButton(
        onPressed: onAboutMePressed,
        child: Text('EXPERIENCE',
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
      );

  Widget _buildMenuButton(BuildContext context) => IconButton(
        icon: Icon(Icons.menu, size: 30),
        onPressed: () {}, // Define appropriate action
      );

  int _getInitialIndex(String category) {
    switch (category) {
      case 'Games':
        return 0;
      case 'Art & Design':
        return 1;
      case 'Writing':
        return 2;
      case 'Software Development':
        return 3;
      default:
        return 0;
    }
  }

  Widget _buildSocialIcon(String assetPath, String url) {
    return IconButton(
      // Use a SizedBox to constrain the size of the image
      icon: SizedBox(
        width: 24, // Set the width to the desired size
        height: 24, // Set the height to the desired size
        child: Image.asset(assetPath),
      ),
      onPressed: () => _launchURL(url),
    );
  }

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

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
