import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For potential icons like the arrow

class DiagnosticsResultWidget extends StatelessWidget {
  const DiagnosticsResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder colors and styles - should be themed or constants
    const Color primaryTextColor = Colors.black87;
    const Color secondaryTextColor = Colors.black54;
    const Color progressRedColor = Colors.pinkAccent;
    const Color progressGreenColor = Colors.green;
    const Color cardBackgroundColor = Colors.white;
    const Color arrowIconColor = Colors.pinkAccent;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'РЕЗУЛЬТАТ ДИАГНОСТИКИ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: arrowIconColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward_ios, size: 12, color: arrowIconColor),
                // child: SvgPicture.asset('assets/icons/arrow_right_red.svg', width: 16, height: 16), // Placeholder
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'По тест-полоске от 23.10.2024',
            style: TextStyle(fontSize: 12, color: secondaryTextColor),
          ),
          const SizedBox(height: 16),
          _buildProgressIndicator(
            label: 'Высокий риск\nвоспаления',
            value: 0.7, // Example value
            color: progressRedColor,
            textColor: secondaryTextColor,
          ),
          const SizedBox(height: 12),
          _buildProgressIndicator(
            label: 'Низкий риск\nкариеса',
            value: 0.3, // Example value
            color: progressGreenColor,
            textColor: secondaryTextColor,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator({
    required String label,
    required double value,
    required Color color,
    required Color textColor,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(fontSize: 12, color: textColor),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 10,
            ),
          ),
        ),
      ],
    );
  }
}