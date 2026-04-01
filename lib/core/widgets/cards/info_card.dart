import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const InfoCard(this.title, this.description, this.icon, {super.key});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translate(0, isHovered ? -4.0 : 0.0),
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.03),
          border: Border.all(
            color: Colors.white.withOpacity(isHovered ? 0.2 : 0.08),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: isHovered ? 30 : 12,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 ACCENT BAR
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 4,
              height: isHovered ? 80 : 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF2D95),
                    Color(0xFF8A2BE2),
                    Color(0xFF00CFFF),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            // 🔥 LEFT SIDE (TEXT)
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: color.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 20),

            // 🔥 RIGHT SIDE (ICON AREA)
            Expanded(
              flex: 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(isHovered ? 0.08 : 0.03),
                ),
                child: Center(
                  child: Icon(
                    widget.icon,
                    size: isHovered ? 36 : 30,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
