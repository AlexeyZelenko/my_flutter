import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Для SVG-іконок

class HelperMainPage extends StatelessWidget {
  const HelperMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _Header(),
          SizedBox(height: 20),
          _CardGrid(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center( // Обертаємо Text віджетом Center
      child: Text(
        'ПОМОЩНИК',
        style: textTheme.titleLarge?.copyWith(
          letterSpacing: -1.67,
          fontFamily: 'GrtskGiga',
        ) ??
            const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: -1.67,
            ),
      ),
    );
  }
}

class _CardGrid extends StatelessWidget {
  const _CardGrid();

  static const _cardData = [
    {'title': 'Сканер тона эмали', 'icon': 'assets/icons/tone_scanner.svg'},
    {'title': 'Тест уровня гигиены', 'icon': 'assets/icons/hygiene_level_test.png'},
    {'title': 'Почему болит', 'icon': 'assets/icons/isolation_mode.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF243F5C).withOpacity(0.08),
            blurRadius: 64,
          ),
        ],
      ),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: _cardData.map((data) {
          final screenWidth = MediaQuery.of(context).size.width;
          final cardWidth = (screenWidth - 40) / 3;
          return SizedBox(
            width: cardWidth,
            child: _CardItem(
              title: data['title'] as String? ?? '', // Добавлена обработка null для title
              icon: data['icon'],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final String? title;
  final dynamic icon;

  const _CardItem({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildIcon(icon, size: 32),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title ?? '',
              style: textTheme.bodySmall?.copyWith(fontSize: 12) ??
                  const TextStyle(fontSize: 12),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/button_share.svg',
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(dynamic iconData, {required double size}) {
    if (iconData is IconData) {
      return Icon(iconData, size: size);
    } else if (iconData is String) {
      final String path = iconData;
      if (path.endsWith('.svg')) {
        return SvgPicture.asset(path, width: size, height: size);
      } else if (path.endsWith('.png') || path.endsWith('.jpg') || path.endsWith('.jpeg')) {
        return Image.asset(path, width: size, height: size);
      }
    }
    return Icon(Icons.error_outline, size: size, color: Colors.red);
  }
}