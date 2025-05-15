import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assuming SVG icons will be used

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder colors and styles - these should be defined in a theme or constants file
    const Color primaryTextColor = Colors.black87;
    const Color secondaryTextColor = Colors.black54;
    const Color iconColor = Colors.pinkAccent; // Example color for heart icon
    const Color starColor = Colors.amber; // Example color for star icon

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar with progress ring (Simplified version)
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      value: 0.8, // 8/10
                      strokeWidth: 3,
                      backgroundColor: Colors.black12,
                      valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 30,
                    // backgroundImage: AssetImage('assets/images/avatar_placeholder.png'), // Placeholder
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 30, color: Colors.white), // Placeholder icon
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ЕКАТЕРИНА',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: iconColor, size: 16),
                        const SizedBox(width: 4),
                        const Text(
                          '8/10',
                          style: TextStyle(color: secondaryTextColor, fontSize: 14),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.star, color: starColor, size: 16),
                        const SizedBox(width: 4),
                        const Text(
                          '25 звёзд',
                          style: TextStyle(color: secondaryTextColor, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}