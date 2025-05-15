import 'package:flutter/material.dart';

class HygieneLevelWidget extends StatelessWidget {
  const HygieneLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 32; // Accounting for horizontal padding

    return Container(
      width: containerWidth,
      padding: const EdgeInsets.symmetric(vertical: 24),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with title and expand button
          Stack(
            children: [
              // Center-aligned title section
              Column(
                children: const [
                  Text(
                    'УРОВЕНЬ\nГИГИЕНЫ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'GrtskGiga',
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: -1.66,
                      height: 1.09,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'По результатам опроса',
                    style: TextStyle(
                      fontFamily: 'ObjectSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF7B878E),
                    ),
                  ),
                ],
              ),

              // Red button with chevron
              Positioned(
                top: 0,
                right: 0,
                child: Container(
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
                ),
              ),

              // Gray checkmark on left side
              Positioned(
                top: 0,
                left: 12,
                child: Container(
                  width: 24,
                  height: 24,
                  child: const Icon(
                    Icons.check,
                    color: Color(0xFFABB2B6),
                    size: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Score value
          const Text(
            '7/10',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Grtsk Giga',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: -1.66,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 12),

          // Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF99D16E).withOpacity(0.2),
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  // Green progress bar (70%)
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 24,
                      width: (containerWidth - 32) * 0.7, // 70% of the width
                      decoration: BoxDecoration(
                        color: const Color(0xFF99D16E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}