import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/Data/dummyData.dart';

import 'package:ramajana05/Core/widgets/CustomeDrawerMenu.dart';
import 'package:ramajana05/Core/widgets/CustomeDropdownMenu.dart';
import 'package:ramajana05/Features/Home/HomeScreen.dart';
import 'package:ramajana05/Features/About/AboutMeScreen.dart';
import 'package:ramajana05/Features/Projects/ProjectListScreen.dart';
import 'package:ramajana05/Features/Projects/ProjectDetailScreen.dart';
import 'package:ramajana05/Core/widgets/TopBar.dart';

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
    Homescreen(title: "Homepage"),
    AboutMeScreen(),
  ];

  @override
  void initState() {
    super.initState();

    // 🔥 initial load (VERY IMPORTANT)
    _handleRoute(html.window.location.pathname ?? '/');

    // 🔥 browser back/forward
    html.window.onPopState.listen((event) {
      _handleRoute(html.window.location.pathname ?? '/');
    });
  }

  // 🔥 CENTRAL ROUTER LOGIC
  void _handleRoute(String path) {
    setState(() {
      if (path.startsWith('/projects/')) {
        final slug = path.split('/projects/').last;

        try {
          _selectedProject = dummyProjects.firstWhere(
            (p) => p.name.toLowerCase().replaceAll(' ', '-') == slug,
          );
          _currentIndex = 2;
        } catch (_) {
          _selectedProject = null;
          _currentIndex = 2;
        }
      } else if (path == '/projects') {
        _selectedProject = null;
        _currentIndex = 2;
      } else if (path == '/about') {
        _selectedProject = null;
        _currentIndex = 1;
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
        title: 'RAMAJANA05',
        onHomePressed: () {
          html.window.history.pushState(null, '', '/');
          _handleRoute('/');
        },
        onAboutMePressed: () {
          html.window.history.pushState(null, '', '/about');
          _handleRoute('/about');
        },
        onProjectPressed: () {
          html.window.history.pushState(null, '', '/projects');
          _handleRoute('/projects');
        },
        onPortfolioIconPressed: _toggleMenuVisibility,
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
    if (_currentIndex != 2) {
      return _pages[_currentIndex];
    }

    // PROJECT LIST
    if (_selectedProject == null) {
      return ProjectListScreen(
        onProjectSelected: (project) {
          final slug = project.name.toLowerCase().replaceAll(' ', '-');

          html.window.history.pushState(
            null,
            '',
            '/projects/$slug',
          );

          _handleRoute('/projects/$slug'); // 🔥 KEY LINE
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
}
