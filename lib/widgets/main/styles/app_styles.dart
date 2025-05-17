import 'package:flutter/material.dart';

/// Константы стилей приложения для удобства использования
class AppStyles {
  // Цвета
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color red = Color(0xFFDF2B50);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // Размеры
  static const double defaultPadding = 16.0;
  static const double smallSpacing = 4.0;
  static const double mediumSpacing = 8.0;
  static const double normalSpacing = 12.0;
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 20.0;
  static const double buttonBorderRadius = 30.0;
  static const double progressFontSize = 12.0;

  // Размеры аватара адаптивны к размеру экрана
  static double getAvatarRadius(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Меньший размер на маленьких экранах
    if (screenWidth < 360) return 22.0;
    // Средний размер на средних экранах
    if (screenWidth < 600) return 26.0;
    // Больший размер на больших экранах
    return 32.0;
  }

  static double getAvatarBorderWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 360) return 1.5;
    return 2.0;
  }
}