import 'package:flutter/material.dart';
import 'task_card.dart';
import 'pagination_indicator.dart';
import 'scale_animation_builder.dart';

/// Виджет секции карточек задач, отображающий карусель заданий с индикатором страниц
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
    // Данные для карточек задач
    final List<Map<String, dynamic>> tasks = [
      {
        'stars': '10',
        'subtitle': 'Задание дня',
        'description': 'Проверьте зубы\nпо тест-полоске',
        'iconPath': 'assets/images/pipette.png',
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
        'iconPath': 'assets/images/toothbrush_2.png',
        'gradient': const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF98D8FF), Color(0x3398D8FF)],
          stops: [0.0, 0.7682],
        ),
      },
      {
        'stars': '?',
        'subtitle': 'Задание',
        'description': 'Проверьте\nчто-то еще',
        'iconPath': 'assets/images/tooth_1.png',
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
                return ScaleAnimationBuilder(
                  controller: _pageController,
                  index: index,
                  child: TaskCard(
                    stars: task['stars'],
                    subtitle: task['subtitle'],
                    description: task['description'],
                    iconPath: task['iconPath'],
                    gradient: task['gradient'] as Gradient,
                    isFirst: index == 0, // Передаем флаг для первой карточки
                  ),
                );
            },
          ),
        ),
        const SizedBox(height: 16),
        // Индикатор страниц
        PaginationIndicator(
          itemCount: tasks.length,
          currentPage: _currentPage,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}