import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final Color progressColor;
  final double progressValue; // Диапазон 0..1

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
      clipBehavior: Clip.antiAlias,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedFractionallySizedBox(
          duration: const Duration(milliseconds: 300),
          widthFactor: progressValue.clamp(0.0, 1.0),
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: progressColor,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(12),
                right: Radius.zero,
              ),
            ),
          ),
        ),
      ),
    );
  }
}