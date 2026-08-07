import 'package:flutter/material.dart';
import 'package:ramajana05/Data/Models/Project.dart';
import 'package:ramajana05/core/widgets/section_header_text.dart';
import 'package:ramajana05/l10n/app_localizations.dart';

class AboutContent extends StatelessWidget {
  final Project project;

  const AboutContent({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderText(
            '${AppLocalizations.of(context)!.about} ${project.name}'),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 620),
          child: const Text(
            'Quotey is a philosophy and quotes app that sends you '
            'a new daily quote at 9:00 AM. You reflect, track your growth '
            'and explore ideas from different worldviews.',
            style: TextStyle(
              fontSize: 15,
              height: 1.7,
              color: Color(0xFF55536A),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Divider(
          color: Color(0xFFEAE8F1),
        ),
        const SizedBox(height: 28),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth < 550 ? 1 : 3;

            return GridView.count(
              crossAxisCount: columns,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: columns == 1 ? 4.5 : 2.1,
              children: const [
                _FeatureItem(
                  icon: Icons.auto_awesome_outlined,
                  title: 'Daily Quotes',
                  description: 'New quote every day\nat 09:00 AM',
                ),
                _FeatureItem(
                  icon: Icons.edit_outlined,
                  title: 'Reflections',
                  description: 'Capture your thoughts\nand insights',
                ),
                _FeatureItem(
                  icon: Icons.public_outlined,
                  title: 'Worldviews',
                  description: 'Explore ideas that\nshape the world',
                ),
                _FeatureItem(
                  icon: Icons.person_outline,
                  title: 'Authors',
                  description: '200+ philosophers\nand thinkers',
                ),
                _FeatureItem(
                  icon: Icons.folder_outlined,
                  title: 'Collections',
                  description: 'Save, organize and\ntrack progress',
                ),
                _FeatureItem(
                  icon: Icons.share_outlined,
                  title: 'Share & Connect',
                  description: 'Share quotes and\nchallenge friends',
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF8064E8);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: purple.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 23,
            color: purple,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.55,
                  color: Color(0xFF656275),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
