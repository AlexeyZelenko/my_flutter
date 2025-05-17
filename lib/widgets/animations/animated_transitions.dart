import 'package:flutter/material.dart';

/// Набор анимированных переходов и эффектов для улучшения пользовательского интерфейса
class AnimatedTransitions {
  /// Создает анимированный переход между экранами с эффектом затухания и сдвига
  static PageRouteBuilder fadeTransition(Widget page, {Duration duration = const Duration(milliseconds: 300)}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var curve = Curves.easeInOut;
        var curveTween = CurveTween(curve: curve);
        
        var fadeTween = Tween<double>(begin: 0.0, end: 1.0);
        var fadeAnimation = fadeTween.animate(animation.drive(curveTween));
        
        var slideTween = Tween<Offset>(begin: const Offset(0.0, 0.1), end: Offset.zero);
        var slideAnimation = slideTween.animate(animation.drive(curveTween));
        
        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        );
      },
    );
  }

  /// Создает анимированный контейнер с эффектом пульсации при нажатии
  static Widget pulseButton({
    required Widget child,
    required VoidCallback onTap,
    Duration duration = const Duration(milliseconds: 200),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1.0, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            onTap();
          },
          onTapDown: (_) => (context as Element).markNeedsBuild(),
          onTapUp: (_) => (context as Element).markNeedsBuild(),
          onTapCancel: () => (context as Element).markNeedsBuild(),
          child: Transform.scale(
            scale: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// Создает анимированный контейнер с эффектом появления
  static Widget animatedContainer({
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
  }) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: child,
    );
  }

  /// Создает Hero анимацию для плавного перехода между экранами
  static Widget heroTransition({
    required String tag,
    required Widget child,
    CreateRectTween? createRectTween,
  }) {
    return Hero(
      tag: tag,
      createRectTween: createRectTween,
      child: child,
    );
  }

  /// Создает анимированный список с эффектом появления элементов
  static Widget staggeredList({
    required List<Widget> children,
    Duration staggerDuration = const Duration(milliseconds: 50),
    Duration animationDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeOut,
    Axis direction = Axis.vertical,
    MainAxisSize mainAxisSize = MainAxisSize.min,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return Builder(
      builder: (context) {
        return Flex(
          direction: direction,
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: List.generate(
            children.length,
            (index) {
              return TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: animationDuration,
                curve: curve,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(
                        0.0,
                        (1.0 - value) * 20,
                      ),
                      child: child,
                    ),
                  );
                },
                child: children[index],
              );
            },
          ),
        );
      },
    );
  }
}