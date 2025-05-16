import 'package:flutter/material.dart';

class ExpandButton extends StatelessWidget {
  const ExpandButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        color: Color(0xFFDF2B50),
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.chevron_right,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}