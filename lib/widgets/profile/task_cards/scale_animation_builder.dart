import 'package:flutter/material.dart';

/// Виджет для создания анимации масштабирования элементов в карусели
class ScaleAnimationBuilder extends StatelessWidget {
  final PageController controller;
  final int index;
  final Widget child;

  const ScaleAnimationBuilder({
    super.key,
    required this.controller,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = (controller.page! - index).abs();
          value = (1 - (value * 0.3)).clamp(0.85, 1.0);
        }
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
}