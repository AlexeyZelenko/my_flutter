import 'package:flutter/material.dart';

class RiskIndicatorData {
  final String label;
  final Color progressColor;
  final double progressValue;

  const RiskIndicatorData({
    required this.label,
    required this.progressColor,
    required this.progressValue,
  });
}