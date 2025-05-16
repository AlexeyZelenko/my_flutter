import 'package:flutter/material.dart';
import 'risk_indicator.dart';
import 'risk_indicator_data.dart';

class RiskIndicatorsRow extends StatelessWidget {
  final List<RiskIndicatorData> indicators;

  const RiskIndicatorsRow({
    super.key,
    required this.indicators,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        indicators.length,
            (index) => Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 4,
              right: index == indicators.length - 1 ? 0 : 4,
            ),
            child: RiskIndicator(
              label: indicators[index].label,
              progressColor: indicators[index].progressColor,
              progressValue: indicators[index].progressValue,
            ),
          ),
        ),
      ),
    );
  }
}