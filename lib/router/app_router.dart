import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ramajana05/main_layout_shell.dart';

import 'package:ramajana05/features/home/presentation/HomeScreen.dart';
import 'package:ramajana05/features/about/presentation/AboutMeScreen.dart';
import 'package:ramajana05/features/contact/contact_screen.dart';
import 'package:ramajana05/features/projects/ProjectListScreen.dart';
import 'package:ramajana05/features/projects/ProjectDetailScreen.dart';

import 'package:ramajana05/data/dummyData.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayoutShell(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return Homescreen(
              title: "Homepage",
              onAboutMePressed: () {
                context.go('/about');
              },
            );
          },
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) {
            return const AboutMeScreen();
          },
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) {
            return const ContactScreen();
          },
        ),
        GoRoute(
          path: '/projects',
          builder: (context, state) {
            return ProjectListScreen(
              onProjectSelected: (project) {
                final slug = project.name.toLowerCase().replaceAll(' ', '-');

                context.go('/projects/$slug');
              },
            );
          },
        ),
        GoRoute(
          path: '/projects/:slug',
          builder: (context, state) {
            final slug = state.pathParameters['slug'];

            final project = getDummyProjects(context).firstWhere(
              (p) => p.name.toLowerCase().replaceAll(' ', '-') == slug,
            );

            return ProjectDetailScreen(
              project: project,
              onBack: () {
                context.go('/projects');
              },
            );
          },
        ),
      ],
    ),
  ],
);
