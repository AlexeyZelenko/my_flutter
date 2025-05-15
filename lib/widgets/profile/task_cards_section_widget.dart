import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons

class TaskCardsSectionWidget extends StatefulWidget {
  const TaskCardsSectionWidget({super.key});

  @override
  State<TaskCardsSectionWidget> createState() => _TaskCardsSectionWidgetState();
}

class _TaskCardsSectionWidgetState extends State<TaskCardsSectionWidget> {
  // Контроллер для PageView с настройкой размера видимой части
  final PageController _pageController = PageController(viewportFraction: 0.45, initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Слушатель для обновления индикатора текущей страницы
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Placeholder data for task cards
    final List<Map<String, dynamic>> tasks = [
      {
        'stars': '10',
        'subtitle': 'Задание дня',
        'description': 'Проверьте зубы\nпо тест-полоске',
        'iconPath': 'assets/images/pipette.png', // Placeholder image
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF2D1E2), Color(0xFFF7E5E7)],
        ),
      },
      {
        'stars': '5',
        'subtitle': 'Задание дня',
        'description': 'Проверьте\nуровень гигиены',
        'iconPath': 'assets/images/toothbrush_2.png', // Placeholder image
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF98D8FF), Color(0x3398D8FF)],
          stops: [0.0, 0.7682],
        ),
      },
      {
        'stars': '?', // Partially visible card
        'subtitle': 'Задание',
        'description': 'Проверьте\nчто-то еще',
        'iconPath': 'assets/images/tooth_1.png', // Placeholder image
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFBFC9E7), Color(0x33BFC9E7)],
          stops: [0.0, 0.7682],
        ),
      },
    ];

    return Column(
      children: [
        SizedBox(
          height: 169,
          child: PageView.builder(
            controller: _pageController,
            padEnds: true,
            physics: const BouncingScrollPhysics(),
            pageSnapping: true, // Обеспечивает привязку к странице при прокрутке
            itemCount: tasks.length,
            itemBuilder: (context, index) {
                final task = tasks[index];
                // Применяем анимацию масштабирования для текущей карточки
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = (_pageController.page! - index).abs();
                      value = (1 - (value * 0.3)).clamp(0.85, 1.0);
                    }
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: _buildTaskCard(
                    context,
                    stars: task['stars'],
                    subtitle: task['subtitle'],
                    description: task['description'],
                    iconPath: task['iconPath'],
                    gradient: task['gradient'] as Gradient,
                    isFirst: false,
                  ),
                );
            },
          ),
        ),
        const SizedBox(height: 16),
        // Индикатор страниц
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            tasks.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == index ? 24 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index 
                    ? const Color(0xFFDF2B50) 
                    : const Color(0xFFDF2B50).withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTaskCard(BuildContext context, {
    required String stars,
    required String subtitle,
    required String description,
    required String iconPath,
    required Gradient gradient,
    bool isFirst = false,
  }) {
    const double cardWidth = 161.67;
    const double cardHeight = 169;
    const double borderRadius = 24.0;
    const TextStyle titleTextStyle = TextStyle(
      fontFamily: 'Object Sans',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color(0xFF2E3F49),
    );
    const TextStyle descriptionTextStyle = TextStyle(
      fontFamily: 'Object Sans',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.1,
      color: Colors.black,
    );

    return Container(
      width: cardWidth,
      height: cardHeight,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 8,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDF2B50),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.star, color: Colors.white, size: 14),
                  ),
                ),
                const SizedBox(width: 4),
                Text('$stars звёзд', style: titleTextStyle),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitle, style: titleTextStyle.copyWith(color: titleTextStyle.color?.withOpacity(0.5))),
                const SizedBox(height: 7),
                Text(description, style: descriptionTextStyle),
              ],
            ),
          ),
          Positioned(
            top: 32,
            right: 16,
            child: Image.asset(
              iconPath,
              height: 70, // Adjust as needed
              fit: BoxFit.contain,
            ),
          ),
          // Sparkle icon
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.wb_sunny_outlined, color: Colors.white, size: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}