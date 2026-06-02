import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/extensions/localization_extension.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';

class ProjectAboutSection extends StatelessWidget {
  final Project project;

  const ProjectAboutSection({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 32 : 60,
        horizontal: isMobile ? 20 : 32,
      ),
      child:
          isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _buildTextContent(context),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: screenHeight * 0.45,
              child: _buildImage(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextContent(context),
        const SizedBox(height: 32),
        _buildImage(),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderText(
          context.l10n.aboutProject,
        ),
        const SizedBox(height: 24),
        Text(
          project.projectReason.isNotEmpty
              ? project.projectReason
              : project.longDescription,
          style: TextStyle(
            fontSize: isMobile ? 16 : 20,
            height: 2.1,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: project.aboutPicture.isNotEmpty
          ? Image.asset(
              project.aboutPicture,
              fit: BoxFit.cover,
              width: double.infinity,
            )
          : Container(
              height: 300,
              color: Colors.black12,
            ),
    );
  }
}
