import 'package:flutter/material.dart';
import 'package:ramajana05/features/home/widgets/GetToKnowMeWidgetParts/GTKMLeftSideWidget.dart';
import 'package:ramajana05/features/home/widgets/GetToKnowMeWidgetParts/GTKMRightSideWidget.dart';

class GetToKnowMeWidget extends StatelessWidget {
  const GetToKnowMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Row(
        children: const [
          Expanded(flex: 1, child: GTKMLeftSideWidget()),
          SizedBox(width: 20),
          Expanded(flex: 1, child: GTKMRightSideWidget()),
        ],
      ),
    );
  }
}
