import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProgressRing extends StatelessWidget {
  final double size;
  final double progress;
  final double strokeWidth;

  const ProgressRing({
    super.key,
    this.size = 87,
    this.progress = 0.8,
    this.strokeWidth = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        value: progress,
        strokeWidth: strokeWidth,
        backgroundColor: ProfileHeaderColors.progressBackground,
        valueColor: const AlwaysStoppedAnimation<Color>(ProfileHeaderColors.red),
      ),
    );
  }
}