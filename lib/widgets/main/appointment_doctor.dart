import 'package:flutter/material.dart';
import 'components/styled_button.dart';

/// Секция с широкими кнопками для главного экрана
class WideCardSection extends StatelessWidget {
  const WideCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          StyledButton(
            text: 'Запись к врачу',
            iconPath: 'assets/icons/appointment_doctor.svg',
            onPressed: () {},
          ),
          const SizedBox(width: 4.0),
          StyledButton(
            text: 'Состав продукта',
            iconPath: 'assets/icons/scanner.svg',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}