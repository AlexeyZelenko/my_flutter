import 'package:flutter/material.dart';
import 'progress_bar.dart';

class RiskIndicator extends StatelessWidget {
  final String label;
  final Color progressColor;
  final double progressValue;
  final Color textColor;

  const RiskIndicator({
    super.key,
    required this.label,
    required this.progressColor,
    required this.progressValue,
    this.textColor = const Color(0xFF000000), // Значение по умолчанию
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label.toUpperCase(), // Принудительный uppercase
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'GrtskGiga', // Убедитесь, что шрифт подключен
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 1.09, // line-height 109%
            letterSpacing: -1.67,
            color: textColor,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          child: ProgressBar(
            progressColor: progressColor,
            progressValue: progressValue,
          ),
        ),
      ],
    );
  }
}