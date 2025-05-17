import 'package:flutter/material.dart';
import 'fade_in_animation.dart';
import 'animated_button.dart';
import 'animated_transitions.dart';

/// Примеры использования анимаций в приложении
class AnimationExamples {
  /// Пример использования FadeInAnimation для создания эффекта появления элементов
  static Widget fadeInExample(Widget child, {int index = 0}) {
    return FadeInAnimation(
      delay: Duration(milliseconds: 100 * index),
      child: child,
    );
  }

  /// Пример использования AnimatedButton для создания интерактивных кнопок
  static Widget animatedButtonExample({
    required Widget child,
    required VoidCallback onPressed,
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return AnimatedButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? Colors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: child,
    );
  }

  /// Пример использования AnimatedContainer для создания анимированных контейнеров
  static Widget animatedContainerExample({
    required Widget child,
    required bool isExpanded,
    double? collapsedHeight,
    double? expandedHeight,
  }) {
    return AnimatedTransitions.animatedContainer(
      height: isExpanded ? expandedHeight : collapsedHeight,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: child,
    );
  }

  /// Пример использования Hero анимации для плавного перехода между экранами
  static Widget heroExample({
    required String tag,
    required Widget child,
  }) {
    return AnimatedTransitions.heroTransition(
      tag: tag,
      child: child,
    );
  }

  /// Пример использования анимированного списка с эффектом появления элементов
  static Widget staggeredListExample(List<Widget> children) {
    return AnimatedTransitions.staggeredList(
      children: children,
      staggerDuration: const Duration(milliseconds: 50),
      animationDuration: const Duration(milliseconds: 400),
    );
  }

  /// Пример использования анимированного перехода между экранами
  static Route<dynamic> pageTransitionExample(Widget page) {
    return AnimatedTransitions.fadeTransition(page);
  }

  /// Инструкции по интеграции анимаций в приложение:
  /// 
  /// 1. Для анимации появления элементов при загрузке экрана:
  ///    ```dart
  ///    FadeInAnimation(
  ///      child: YourWidget(),
  ///      delay: Duration(milliseconds: 200),
  ///    )
  ///    ```
  /// 
  /// 2. Для анимированных кнопок с эффектом нажатия:
  ///    ```dart
  ///    AnimatedButton(
  ///      onPressed: () {
  ///        // Действие при нажатии
  ///      },
  ///      child: Text('Нажми меня'),
  ///    )
  ///    ```
  /// 
  /// 3. Для анимированных переходов между экранами:
  ///    ```dart
  ///    Navigator.of(context).push(
  ///      AnimatedTransitions.fadeTransition(YourNextScreen())
  ///    );
  ///    ```
  /// 
  /// 4. Для создания Hero анимации между экранами:
  ///    ```dart
  ///    // На первом экране
  ///    AnimatedTransitions.heroTransition(
  ///      tag: 'unique_tag',
  ///      child: YourWidget(),
  ///    )
  ///    
  ///    // На втором экране
  ///    AnimatedTransitions.heroTransition(
  ///      tag: 'unique_tag',
  ///      child: YourExpandedWidget(),
  ///    )
  ///    ```
  /// 
  /// 5. Для анимированного списка с последовательным появлением элементов:
  ///    ```dart
  ///    AnimatedTransitions.staggeredList(
  ///      children: yourWidgetList,
  ///    )
  ///    ```
}