import 'package:flutter/material.dart';
import 'hygiene_container.dart';
import 'hygiene_header.dart';
import 'hygiene_date_info.dart';
import 'risk_indicators/risk_indicators_row.dart';
import 'risk_indicators/risk_indicator_data.dart';

class HygieneLevelWidget extends StatelessWidget {
  const HygieneLevelWidget({super.key});

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
            title: 'УРОВЕНЬ\nГИГИЕНЫ',
          ),

          const SizedBox(height: 10),

          // Дата теста
          const DiagnosticsDateInfo(
            date: 'По результатам опроса',
          ),

          const SizedBox(height: 32),

          // Строка с индикаторами риска
          const RiskIndicatorsRow(
            indicators: [
              RiskIndicatorData(
                label: '7 / 10',
                progressColor: Color(0xFF99D16E),
                progressValue: 0.7,
                textStyle: TextStyle( // Добавляем свои стили
                  fontFamily: 'YourCustomFont',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}