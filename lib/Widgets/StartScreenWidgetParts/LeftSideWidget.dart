import 'package:flutter/material.dart';
import 'package:ramajana05/Core/theme/appColors.dart';

class LeftSideWidget extends StatefulWidget {
  const LeftSideWidget({super.key});

  @override
  State<LeftSideWidget> createState() => _LeftSideWidgetState();
}

class _LeftSideWidgetState extends State<LeftSideWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _animation = ColorTween(
      begin: Colors.blue.withOpacity(0.5),
      end: Colors.purple.withOpacity(0.5),
    ).animate(_controller);

    // Rebuild widget when animation value changes
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 150, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Two horizontal lines
          Row(
            children: [
              Container(
                width: 150,
                height: 20,
                color: AppColors.black,
              ),
              Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      _animation.value ??
                          Colors.purple, // fallback if animation value is null
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6), // Smaller spacing above name
          const Text(
            'RAMAJANA',
            style: TextStyle(
              fontSize: 90,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 1), // Reduced spacing
          const Text(
            'SKOPLJAK',
            style: TextStyle(
              fontSize: 85,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize:
                MainAxisSize.min, // Keeps the row as tight as its content
            children: const [
              Text(
                'CREATIVE ',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Blue color for "CREATIVE"
                ),
              ),
              Text(
                'DEVELOPER',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Optional, default is black
                ),
              ),
            ],
          ),
          const SizedBox(height: 30), // Reduced spacing
          const Text(
            'BACHELOR OF SCIENCE 2025',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisSize:
                MainAxisSize.min, // Keeps the row as tight as its content
            children: const [
              Text(
                'DRIVEN BY ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'DIVERSITY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 122, 13, 147), // Optional, default is black
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
