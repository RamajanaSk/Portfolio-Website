import 'package:flutter/material.dart';

class GTKMRightSideWidget extends StatelessWidget {
  const GTKMRightSideWidget({super.key});

  final List<String> _images = const [
    'assets/img1.jpg',
    'assets/img2.jpg',
    'assets/img3.jpg',
    'assets/img4.jpg',
    'assets/img5.jpg',
    'assets/img1.jpg',
    'assets/img2.jpg',
    'assets/img3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final totalWidth =
        MediaQuery.of(context).size.width * 0.45; // half of the screen
    const imageHeight = 200.0;
    const spacing = 8.0;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row 1: 70% + 30%
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSizedImage(
                  _images[0], totalWidth * 0.7 - spacing / 2, imageHeight),
              SizedBox(width: spacing),
              _buildSizedImage(
                  _images[1], totalWidth * 0.3 - spacing / 2, imageHeight),
            ],
          ),
          SizedBox(height: spacing),
          // Row 2: 30% + 70%
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSizedImage(
                  _images[2], totalWidth * 0.3 - spacing / 2, imageHeight),
              SizedBox(width: spacing),
              _buildSizedImage(
                  _images[3], totalWidth * 0.7 - spacing / 2, imageHeight),
            ],
          ),
          SizedBox(height: spacing),
          // Row 3: 4 equal square images
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(4, (index) {
              double itemWidth = (totalWidth - 3 * spacing) / 4;
              return Padding(
                padding: EdgeInsets.only(
                  right: index < 3 ? spacing : 0,
                ),
                child: _buildSizedImage(
                  _images[4 + index],
                  itemWidth,
                  imageHeight,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSizedImage(String path, double width, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
