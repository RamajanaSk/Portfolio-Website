import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/Data/dummyData.dart';

import 'package:ramajana05/core/widgets/custome_drawer_menu.dart';
import 'package:ramajana05/core/widgets/dropdown/custome_dropdown_menu.dart';
import 'package:ramajana05/core/widgets/top_bar.dart';
import 'package:ramajana05/features/Home/HomeScreen.dart';

import 'package:ramajana05/features/Projects/ProjectListScreen.dart';
import 'package:ramajana05/features/Projects/ProjectDetailScreen.dart';
import 'package:ramajana05/features/about/presentation/AboutMeScreen.dart';
import 'package:ramajana05/features/contact/contact_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  Project? _selectedProject;

  bool _isMenuVisible = false;
  bool _isMouseOverMenu = false;
  Timer? _hideMenuTimer;

  final List<Widget> _pages = [
    const Homescreen(title: "Homepage"),
    AboutMeScreen(),
    const ContactScreen(),
  ];

  @override
  void initState() {
    super.initState();

    // initial route ONLY ONCE
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleRoute(_getCurrentPath());
    });

    html.window.onPopState.listen((event) {
      _handleRoute(_getCurrentPath());
    });
  }

  void _handleRoute(String path) {
    if (!mounted) return;

    setState(() {
      if (path.startsWith('/projects/')) {
        final slug = path.split('/projects/').last;

        try {
          _selectedProject = dummyProjects.firstWhere(
            (p) => p.name.toLowerCase().replaceAll(' ', '-') == slug,
          );
          _currentIndex = 3;
        } catch (_) {
          _selectedProject = null;
          _currentIndex = 3;
        }
      } else if (path == '/projects') {
        _selectedProject = null;
        _currentIndex = 3;
      } else if (path == '/about') {
        _selectedProject = null;
        _currentIndex = 1;
      } else if (path == '/contact') {
        _selectedProject = null;
        _currentIndex = 2;
      } else {
        _selectedProject = null;
        _currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    Widget menuWidget = isMobile
        ? CustomeDrawerMenu(isVisible: _isMenuVisible)
        : MouseRegion(
            onEnter: (_) => _setMouseOverMenu(true),
            onExit: (_) => _setMouseOverMenu(false),
            child: CustomeDropdownMenu(isVisible: _isMenuVisible),
          );

    double appBarHeight = AppBar().preferredSize.height * 0.001;

    return Scaffold(
      appBar: TopBar(
        title: 'RAMAJANA SKOPLJAK',
        onHomePressed: () {
          _navigateTo('/');
        },
        onAboutMePressed: () {
          _navigateTo('/about');
        },
        onProjectPressed: () {
          _navigateTo('/projects');
        },
        onContactPressed: () {
          _navigateTo('/contact');
        },
        isDropdownVisible: _isMenuVisible,
      ),
      body: Stack(
        children: [
          _buildCurrentPage(),
          if (_isMenuVisible && !isMobile)
            Positioned(
              top: appBarHeight,
              left: 0,
              right: 0,
              child: menuWidget,
            ),
          if (_isMenuVisible && isMobile)
            Positioned.fill(
              child: CustomeDrawerMenu(isVisible: _isMenuVisible),
            ),
        ],
      ),
    );
  }

  Widget _buildCurrentPage() {
    // HOME / ABOUT
    if (_currentIndex != 3) {
      return _pages[_currentIndex];
    }

    // PROJECT LIST
    if (_selectedProject == null) {
      return ProjectListScreen(
        onProjectSelected: (project) {
          final slug = project.name.toLowerCase().replaceAll(' ', '-');
          _navigateTo('/projects/$slug'); // ✅ ONLY THIS
        },
      );
    }

    // PROJECT DETAIL
    return ProjectDetailScreen(
      project: _selectedProject!,
      onBack: () {}, // not used anymore
    );
  }

  void _toggleMenuVisibility() {
    bool newState = !_isMenuVisible;
    _setMenuVisibility(newState);

    if (MediaQuery.of(context).size.width < 600 && newState) {
      _resetHideMenuTimer();
    }
  }

  void _setMenuVisibility(bool isVisible) {
    setState(() {
      _isMenuVisible = isVisible;

      if (!isVisible || MediaQuery.of(context).size.width < 600) {
        _cancelHideMenuTimer();
      }
    });
  }

  void _setMouseOverMenu(bool isOver) {
    if (MediaQuery.of(context).size.width < 600) return;

    setState(() {
      _isMouseOverMenu = isOver;

      if (isOver) {
        _cancelHideMenuTimer();
      } else {
        _resetHideMenuTimer();
      }
    });
  }

  void _resetHideMenuTimer() {
    _cancelHideMenuTimer();

    if (!_isMouseOverMenu && MediaQuery.of(context).size.width < 600) return;

    _hideMenuTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isMenuVisible = false;
        });
      }
    });
  }

  void _cancelHideMenuTimer() {
    _hideMenuTimer?.cancel();
  }

  @override
  void dispose() {
    _cancelHideMenuTimer();
    super.dispose();
  }

  void _navigateTo(String path) {
    html.window.history.pushState(null, '', '#$path');
    _handleRoute(path);
  }

  String _getCurrentPath() {
    final hash = html.window.location.hash;

    if (hash.isNotEmpty && hash.startsWith('#')) {
      return hash.substring(1); // remove #
    }

    return html.window.location.pathname ?? '/';
  }
}
