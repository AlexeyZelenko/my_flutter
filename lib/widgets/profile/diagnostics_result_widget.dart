import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For potential icons like the arrow

class DiagnosticsResultWidget extends StatelessWidget {
  const DiagnosticsResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 367,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 32), // Отступ для стрелки
                child: Text(
                  'РЕЗУЛЬТАТ ДИАГНОСТИКИ',
                  style: TextStyle(
                    fontFamily: 'Grtsk Giga',
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    letterSpacing: -1.66516,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDF2B50),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/chevron_down.svg', // Замените на вашу иконку стрелки
                      width: 12,
                      height: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'По тест-полоске от 23.10.2024',
            style: TextStyle(
              fontFamily: 'Object Sans',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF7B878E),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: _buildRiskIndicator(
                  label: 'Высокий риск\nвоспаления',
                  progressColor: const Color(0xFFDE949E),
                  progressValue: 0.7, // Example value
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildRiskIndicator(
                  label: 'Низкий риск\nкариеса',
                  progressColor: const Color(0xFF99D16E),
                  progressValue: 0.3, // Example value
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
            fontFamily: 'Object Sans',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF7B878E),
          ),
        ),
        const SizedBox(height: 12),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: progressColor.withOpacity(0.2),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 24,
                width: 163.5 * progressValue, // Adjust width based on value
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [progressColor.withOpacity(0.8), progressColor],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Transform.rotate(
                angle: -3.1415926535 * 180 / 180, // Rotate 180 degrees
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: progressColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}