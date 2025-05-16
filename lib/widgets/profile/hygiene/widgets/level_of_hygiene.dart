import 'package:flutter/material.dart';
import 'hygiene_container.dart';
import 'hygiene_header.dart';
import 'hygiene_date_info.dart';
import 'risk_indicators/risk_indicators_row.dart';
import 'risk_indicators/risk_indicator_data.dart';

class DiagnosticsResultWidget extends StatelessWidget {
  const DiagnosticsResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 32; // Учитываем горизонтальные отступы

    return DiagnosticsContainer(
      width: containerWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Заголовок с иконкой и кнопкой
          const DiagnosticsHeader(
            icon: 'assets/icons/heart_grey_selected.svg',
            title: 'РЕЗУЛЬТАТ\nДИАГНОСТИКИ',
          ),

          const SizedBox(height: 10),

          // Дата теста
          const DiagnosticsDateInfo(
            date: 'По тест-полоске от 23.10.2024',
          ),

          const SizedBox(height: 32),

          // Строка с индикаторами риска
          const RiskIndicatorsRow(
            indicators: [
              RiskIndicatorData(
                label: 'Высокий риск\nвоспаления',
                progressColor: Color(0xFFDE949E),
                progressValue: 0.6,
              ),
              RiskIndicatorData(
                label: 'Низкий риск\nкариеса',
                progressColor: Color(0xFF99D16E),
                progressValue: 0.15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}