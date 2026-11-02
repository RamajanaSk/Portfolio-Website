import 'package:flutter/material.dart';
import 'package:ramajana05/features/home/data/domain/current_project.dart';

import 'package:ramajana05/features/home/presentation/widgets/currently/current_project_card.dart';
import 'package:ramajana05/features/home/presentation/widgets/currently_building_header.dart';

class HomeCurrentlySection extends StatelessWidget {
  final List<CurrentProject> projects;

  const HomeCurrentlySection({
    super.key,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 20 : 32,
            vertical: mobile ? 32 : 48,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CurrentlyBuildingHeader(),
                  const SizedBox(height: 28),
                  LayoutBuilder(
                    builder: (context, inner) {
                      const gap = 16.0;
                      final columns = inner.maxWidth < 1000 ? 1 : 2;
                      final width =
                          (inner.maxWidth - gap * (columns - 1)) / columns;

                      return Wrap(
                        spacing: gap,
                        runSpacing: gap,
                        children: [
                          for (final project in projects)
                            SizedBox(
                              width: width,
                              child: CurrentProjectCard(
                                project: project,
                              ),
                            ),
                        ],
                      );
                    },
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
