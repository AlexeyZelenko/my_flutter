import 'package:flutter/material.dart';

class ConsciousCareGuide extends StatelessWidget {
  const ConsciousCareGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final cardsData = [
      {
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF98D8FF), Color(0x3398D8FF)],
          stops: [0.0, 0.7682],
        ),
        'title': 'Обзор новых средств',
        'border': Border.all(color: const Color(0xFF99D16E), width: 2),
        'image': 'assets/images/toothbrush1.png',
      },
      {
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFBFC9E7), Color(0x33BFC9E7)],
          stops: [0.0, 0.7682],
        ),
        'title': 'Что делать, если выбили зуб',
        'image': 'assets/images/tooth_1.png',
      },
      {
        'gradient': const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xFFF7E5E7), Color(0xFFF7E5E7)],
        ),
        'title': 'Еще что-то важное',
        'image': 'assets/images/tooth_2.png',
      },
    ];

    final cardTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: 'ObjectSans',
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      height: 1.1,
      letterSpacing: 0.0,
    ) ??
        const TextStyle(
          fontFamily: 'ObjectSans',
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          height: 1.1,
          letterSpacing: 0.0,
        );

    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(right: 0),
      child: Column(
        children: [
          Text(
            'ГИД ПО ОСОЗНАННОЙ ЗАБОТЕ',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'GrtskGiga',
              fontWeight: FontWeight.w500,
              fontSize: 19.0,
              height: 1.09,
              letterSpacing: -1.67,
            ).copyWith(
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20.0), // Додаємо відступ зліва для прокрутки
            child: Row(
              children: cardsData.map((card) {
                return Container(
                  width: 169,
                  height: 169,
                  margin: EdgeInsets.only(right: cardsData.last == card ? 0 : 6, left: 0), // Забираємо початковий відступ тут
                  decoration: BoxDecoration(
                    gradient: card['gradient'] as Gradient?,
                    borderRadius: BorderRadius.circular(24),
                    border: card['border'] as Border?,
                  ),
                  foregroundDecoration: BoxDecoration(
                    gradient: card['foregroundGradient'] as Gradient?,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Image.asset(
                                card['image'] as String,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          card['title'] as String,
                          style: cardTextStyle,
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