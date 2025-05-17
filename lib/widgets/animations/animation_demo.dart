import 'package:flutter/material.dart';
import 'fade_in_animation.dart';
import 'animated_button.dart';
import 'animated_transitions.dart';
import 'animation_examples.dart';

/// Демонстрационный экран с примерами анимаций
class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  bool _isExpanded = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Демонстрация анимаций'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок с анимацией появления
            FadeInAnimation(
              delay: const Duration(milliseconds: 100),
              child: const Text(
                'Примеры анимаций',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            
            // Анимированные кнопки
            FadeInAnimation(
              delay: const Duration(milliseconds: 200),
              offset: const Offset(0, 20),
              child: const Text(
                'Анимированные кнопки',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            
            // Примеры анимированных кнопок
            AnimatedTransitions.staggeredList(
              children: [
                AnimatedButton(
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: const Text(
                    'Нажми меня',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                AnimatedButton(
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: const Text(
                    'Еще кнопка',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Анимированный контейнер
            FadeInAnimation(
              delay: const Duration(milliseconds: 300),
              offset: const Offset(0, 20),
              child: const Text(
                'Анимированный контейнер',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            
            // Пример анимированного контейнера
            AnimatedButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              child: AnimationExamples.animatedContainerExample(
                isExpanded: _isExpanded,
                collapsedHeight: 80,
                expandedHeight: 200,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple.shade800],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Нажми, чтобы раскрыть',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      if (_isExpanded) ...[  
                        const Text(
                          'Этот контейнер использует AnimatedContainer для плавного изменения размера при нажатии. Вы можете использовать этот подход для создания раскрывающихся карточек, меню и других интерактивных элементов.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // Последовательная анимация списка
            FadeInAnimation(
              delay: const Duration(milliseconds: 400),
              offset: const Offset(0, 20),
              child: const Text(
                'Последовательная анимация списка',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            
            // Пример последовательной анимации списка
            AnimatedTransitions.staggeredList(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text('Элемент списка ${index + 1}'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}