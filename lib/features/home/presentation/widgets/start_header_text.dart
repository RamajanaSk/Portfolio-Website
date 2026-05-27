import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';
import 'package:ramajana05/core/utils/file_downloader.dart';
import 'package:ramajana05/core/widgets/buttons/gradient_button.dart';
import 'package:ramajana05/core/widgets/buttons/outline_button.dart';
import 'package:ramajana05/core/widgets/decorative_line.dart';
import 'package:ramajana05/core/widgets/social_links_row.dart';

class GTKMLeftSideWidget extends StatelessWidget {
  const GTKMLeftSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecorativeLine(
              leftColor: Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(height: 6),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                'RAMAJANA',
                style: AppTextStyles.name(context),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                'SKOPLJAK',
                style: AppTextStyles.name(context),
              ),
            ),
            const SizedBox(height: 12),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppGradients.primary.createShader(bounds),
                    child: Text(
                      'CREATIVE ',
                      style: AppTextStyles.role(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'DEVELOPER',
                    style: AppTextStyles.role(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                  'FLUTTER • MOBILE • INTERACTIVE EXPERIENCES\nBUILDING PERFORMANT, USER-FOCUSED APPLICATIONS.',
                  style: AppTextStyles.description(context)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SocialLinksRow(),
                const SizedBox(width: 12),
                _buildButtons(context),
              ],
            ),
          ],
        ));
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GradientButton(
          text: "Download CV",
          onPressed: () {
            FileDownloader.downloadAsset(
              assetPath: 'pdfs/cv.pdf',
              fileName: 'Ramajana_Skopljak_CV.pdf',
            );
            //FileDownloader.openAsset(
            //assetPath: 'pdfs/cv.pdf',
            //);
          },
        ),
        const SizedBox(width: 12),
        NeonOutlineButton(
          text: "View Portfolio",
          onPressed: () {
            FileDownloader.openAsset(
              assetPath: 'pdfs/software_portfolio.pdf',
            );
          },
        ),
      ],
    );
  }
}
