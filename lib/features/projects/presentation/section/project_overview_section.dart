import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';

import 'package:ramajana05/features/projects/presentation/widget/project_header.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_info_card.dart';

class Projectoverviewsection extends StatelessWidget {
  final Project project;

  const Projectoverviewsection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: ProjectHeader(project: project),
              ),
              const SizedBox(height: 24),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: _buildLogo(),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: _buildPreview(),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: _buildInfoCard(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 350,
            child: ProjectHeader(project: project),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 250,
            child: _buildPreview(),
          ),
          const SizedBox(height: 24),
          _buildInfoCard(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: project.logoPicture.isNotEmpty
          ? Image.asset(
              project.logoPicture,
              fit: BoxFit.contain,
            )
          : Container(color: Colors.black12),
    );
  }

  Widget _buildPreview() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: project.mockupPicture.isNotEmpty
          ? Image.asset(
              project.previewPicture,
              fit: BoxFit.cover,
            )
          : Container(color: Colors.black12),
    );
  }

  Widget _buildInfoCard() {
    return ProjectInfoCard(
      technologies: project.technologies.join(", "),
      description: project.shortDescription,
      role: project.role,
      outcome: "",
      startDate: project.startDate,
      endDate: project.endDate,
    );
  }
}
