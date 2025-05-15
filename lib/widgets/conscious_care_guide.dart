import 'package:flutter/material.dart';

class ConsciousCareGuide extends StatelessWidget {
  const ConsciousCareGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      {
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF98D8FF), Color(0xff98d8ff33)],
        ),
        'title': 'Обзор новых средств',
        'border': Border.all(color: const Color(0xFF99D16E), width: 2),
      },
      {
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFBFC9E7), Color(0xffbfc9e733)],
        ),
        'title': 'Что делать, если выбили зуб',
      },
      {
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF7E5E7), Color(0xFFF7E5E7)],
        ),
        'title': 'Что делать, если выбили зуб',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'ГИД ПО ОСОЗНАННОЙ ЗАБОТЕ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: cards.map((card) {
                return Container(
                  width: 169,
                  height: 169,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    gradient: card['gradient'] as Gradient,
                    borderRadius: BorderRadius.circular(24),
                    border: card['border'] as Border?,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          card['title'] as String,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}