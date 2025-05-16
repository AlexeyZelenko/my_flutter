import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final Color progressColor;
  final double progressValue;

  const ProgressBar({
    super.key,
    required this.progressColor,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: progressColor.withOpacity(0.2),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              height: 24,
              width: progressValue * 100.0,
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}