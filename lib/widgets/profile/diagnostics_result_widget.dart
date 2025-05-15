import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiagnosticsResultWidget extends StatelessWidget {
  const DiagnosticsResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 32; // Accounting for horizontal padding

    return Container(
      width: containerWidth,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header with title and expand button
          Stack(
            alignment: Alignment.centerLeft, // Align children to the left
            children: [
              // Placeholder for the left icon
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 15), // Added top padding for the icon
                child: SvgPicture.asset(
                  'assets/icons/heart_grey_selected.svg', // Замените на путь к вашему файлу
                  width: 16,
                  height: 16,
                ),
              ),

              // Center-aligned title
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 15), // Added top padding for the title to align visually
                  child: Text(
                    'РЕЗУЛЬТАТ\nДИАГНОСТИКИ',
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
                ),
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
            ],
          ),

          const SizedBox(height: 10),

          // Date text
          const Text(
            'По тест-полоске от 23.10.2024',
            style: TextStyle(
              fontFamily: 'ObjectSans',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF7B878E),
            ),
          ),

          const SizedBox(height: 32),

          // Risk indicators row
          Row(
            children: [
              Expanded(
                child: _buildRiskIndicator(
                  label: 'Высокий риск\nвоспаления',
                  progressColor: const Color(0xFFDE949E),
                  progressValue: 0.6, // Adjusted to match image
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildRiskIndicator(
                  label: 'Низкий риск\nкариеса',
                  progressColor: const Color(0xFF99D16E),
                  progressValue: 0.15, // Adjusted to match image
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRiskIndicator({
    required String label,
    required Color progressColor,
    required double progressValue,
  }) {
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
        Container(
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: progressColor.withOpacity(0.2),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              // Gradient progress bar
              Positioned(
                left: 0,
                child: Container(
                  height: 24,
                  width: progressValue * 100.0, // Dynamic width based on value
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}