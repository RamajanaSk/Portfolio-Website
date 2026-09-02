import 'package:flutter/material.dart';
import 'package:ramajana05/core/theme/app_gradients.dart';
import 'package:ramajana05/core/theme/app_text_styles.dart';

class EyebrowText extends StatelessWidget {
  final String number;
  final String text;

  const EyebrowText({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.description(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => AppGradients.primary.createShader(bounds),
          child: Text(
            number,
            style: style.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 28,
          height: 1,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .25),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: style.copyWith(
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: .4),
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
