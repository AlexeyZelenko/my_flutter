import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Виджет карточки задания, отображающий информацию о задаче
class TaskCard extends StatelessWidget {
  final String stars;
  final String subtitle;
  final String description;
  final String iconPath;
  final Gradient gradient;
  final bool isFirst;

  const TaskCard({
    super.key,
    required this.stars,
    required this.subtitle,
    required this.description,
    required this.iconPath,
    required this.gradient,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
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
      margin: EdgeInsets.only(
        left: isFirst ? 16 : 6, // Больше отступ слева для первой карточки
        right: 6,
      ),
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
            top: 40,
            left: 12,
            child: Text(subtitle, style: titleTextStyle),
          ),
          Positioned(
            top: 60,
            left: 12,
            child: Text(description, style: descriptionTextStyle),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: Image.asset(
              iconPath,
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}