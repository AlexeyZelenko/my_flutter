import 'package:flutter/material.dart';
import '../constants/colors.dart';

class InfoBox extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Widget child;

  const InfoBox({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: ProfileHeaderColors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}