import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_header.dart';
import 'package:ramajana05/features/projects/presentation/widget/project_info_card.dart';

class Projectoverviewsection extends StatelessWidget {
  final Project project;

  const Projectoverviewsection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 400,
          child: ProjectHeader(
            project: project,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 300,
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: _buildLogo(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildPreview(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildInfoCard(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 300,
          child: ProjectHeader(
            project: project,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 220,
          child: _buildPreview(),
        ),
        const SizedBox(height: 24),
        _buildInfoCard(),
      ],
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
          : Container(
              color: Colors.black12,
            ),
    );
  }

  Widget _buildPreview() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: project.previewPicture.isNotEmpty
          ? Image.asset(
              project.previewPicture,
              fit: BoxFit.cover,
            )
          : Container(
              color: Colors.black12,
            ),
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
