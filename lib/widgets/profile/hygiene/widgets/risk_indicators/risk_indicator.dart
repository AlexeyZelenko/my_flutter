import 'package:flutter/material.dart';
import 'progress_bar.dart';

class RiskIndicator extends StatelessWidget {
  final String label;
  final Color progressColor;
  final double progressValue;

  const RiskIndicator({
    super.key,
    required this.label,
    required this.progressColor,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'ObjectSans',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.0,
            color: Color(0xFF7B878E),
          ),
        ),
        const SizedBox(height: 12),
        ProgressBar(
          progressColor: progressColor,
          progressValue: progressValue,
        ),
      ],
    );
  }
}