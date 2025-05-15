import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons

class TaskCardsSectionWidget extends StatelessWidget {
  const TaskCardsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data for task cards
    final List<Map<String, dynamic>> tasks = [
      {
        'stars': '10',
        'subtitle': 'Задание дня',
        'description': 'Проверьте зубы\nпо тест-полоске',
        'iconPath': 'assets/images/pipette.png', // Placeholder image
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF2D1E2), Color(0xFFF7E5E7)],
        ),
      },
      {
        'stars': '5',
        'subtitle': 'Задание дня',
        'description': 'Проверьте\nуровень гигиены',
        'iconPath': 'assets/images/toothbrush_2.png', // Placeholder image
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF98D8FF), Color(0x3398D8FF)],
          stops: [0.0, 0.7682],
        ),
      },
      {
        'stars': '?', // Partially visible card
        'subtitle': 'Задание',
        'description': 'Проверьте\nчто-то еще',
        'iconPath': 'assets/images/tooth_1.png', // Placeholder image
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFBFC9E7), Color(0x33BFC9E7)],
          stops: [0.0, 0.7682],
        ),
      },
    ];

    return SizedBox(
      height: 169,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return _buildTaskCard(
            context,
            stars: task['stars'],
            subtitle: task['subtitle'],
            description: task['description'],
            iconPath: task['iconPath'],
            gradient: task['gradient'] as Gradient,
            isFirst: index == 0,
          );
        },
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context, {
    required String stars,
    required String subtitle,
    required String description,
    required String iconPath,
    required Gradient gradient,
    bool isFirst = false,
  }) {
    const double cardWidth = 161.67;
    const double cardHeight = 169;
    const double borderRadius = 24.0;
    const TextStyle titleTextStyle = TextStyle(
      fontFamily: 'Object Sans',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color(0xFF2E3F49),
    );
    const TextStyle descriptionTextStyle = TextStyle(
      fontFamily: 'Object Sans',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.1,
      color: Colors.black,
    );

    return Container(
      width: cardWidth,
      height: cardHeight,
      margin: EdgeInsets.only(left: isFirst ? 0 : 6),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 8,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDF2B50),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.star, color: Colors.white, size: 14),
                  ),
                ),
                const SizedBox(width: 4),
                Text('$stars звёзд', style: titleTextStyle),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitle, style: titleTextStyle.copyWith(color: titleTextStyle.color?.withOpacity(0.5))),
                const SizedBox(height: 7),
                Text(description, style: descriptionTextStyle),
              ],
            ),
          ),
          Positioned(
            top: 32,
            right: 16,
            child: Image.asset(
              iconPath,
              height: 70, // Adjust as needed
              fit: BoxFit.contain,
            ),
          ),
          // Sparkle icon (placeholder)
          Positioned(
            top: 12,
            right: 12,
            child: Icon(Icons.wb_incandescent_outlined, color: Colors.white.withOpacity(0.8), size: 16),
          ),
        ],
      ),
    );
  }
}