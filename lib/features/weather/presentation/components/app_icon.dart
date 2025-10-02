import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Color(0xFF3B82F6),
            Color(0xFF4F46E5),
          ],
        ),
      ),
      child: Icon(
        Icons.cloudy_snowing,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
