import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons

class TaskCardsSectionWidget extends StatelessWidget {
  const TaskCardsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data for task cards
    final List<Map<String, dynamic>> tasks = [
      {
        'title': '10 звёзд',
        'subtitle': 'Задание дня',
        'description': 'Проверьте зубы\nпо тест-полоске',
        'iconPath': 'assets/icons/task_icon_1_placeholder.svg', // Placeholder
        'badgeIconPath': 'assets/icons/star_badge_placeholder.svg', // Placeholder
        'color': Colors.pink[100], // Example color
      },
      {
        'title': '5 звёзд',
        'subtitle': 'Задание дня',
        'description': 'Проверьте\nуровень гигиены',
        'iconPath': 'assets/icons/task_icon_2_placeholder.svg', // Placeholder
        'badgeIconPath': 'assets/icons/star_badge_placeholder.svg', // Placeholder
        'color': Colors.blue[100], // Example color
      },
      {
        'title': '?', // From image, one more card is partially visible
        'subtitle': 'Задание',
        'description': 'Проверьте\nчто-то еще',
        'iconPath': 'assets/icons/task_icon_3_placeholder.svg', // Placeholder
        'badgeIconPath': 'assets/icons/star_badge_placeholder.svg', // Placeholder
        'color': Colors.green[100], // Example color
      },
    ];

    return SizedBox(
      height: 180, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return _buildTaskCard(
            context,
            title: task['title'],
            subtitle: task['subtitle'],
            description: task['description'],
            iconPath: task['iconPath'],
            badgeIconPath: task['badgeIconPath'],
            cardColor: task['color'] ?? Colors.grey[200]!,
          );
        },
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context, {
    required String title,
    required String subtitle,
    required String description,
    required String iconPath,
    required String badgeIconPath,
    required Color cardColor,
  }) {
    return Container(
      width: 150, // Adjust width as needed
      margin: const EdgeInsets.only(right: 12.0, top: 8.0, bottom: 8.0, left: 4.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subtitle, style: TextStyle(fontSize: 10, color: Colors.black54)),
              const SizedBox(height: 4),
              Text(description, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
              const Spacer(),
              // Placeholder for the main icon of the task (e.g., toothbrush)
              // SvgPicture.asset(iconPath, width: 40, height: 40, color: Colors.black54),
              Icon(Icons.brush, size: 30, color: Colors.black.withOpacity(0.6)), // Placeholder
            ],
          ),
          Positioned(
            top: -5,
            right: -5,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.redAccent, // Color from image for the badge
                shape: BoxShape.circle,
              ),
              child: Row(
                children: [
                  // SvgPicture.asset(badgeIconPath, width: 10, height: 10, color: Colors.white),
                  Icon(Icons.star, size: 10, color: Colors.white), // Placeholder badge icon
                  const SizedBox(width: 2),
                  Text(
                    title.split(' ')[0], // Assuming title is like '10 звёзд'
                    style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}