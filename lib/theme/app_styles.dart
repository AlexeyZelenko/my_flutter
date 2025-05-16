import 'package:flutter/material.dart';

/// Клас, що містить усі стилі додатку
class AppStyles {
  // Кольори
  static const Color primaryColor = Color(0xFFDF2B50);
  static const Color secondaryColor = Color(0xFF000000);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color textPrimaryColor = Color(0xFF000000);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color dividerColor = Color(0xFFE0E0E0);
  static const Color errorColor = Color(0xFFB00020);
  static const Color successColor = Color(0xFF4CAF50);
  
  // Кольори з брендбуку
  static const Color brandLightPink = Color(0xFFECC3C8);
  static const Color brandPink = Color(0xFFDE949E);
  static const Color brandRed = Color(0xFFBA0C2F);
  static const Color brandBlue = Color(0xFF2E3F49);
  static const Color brandLightBlue = Color(0xFF70B7D2);
  static const Color brandYellow = Color(0xFFF1DD6B);
  static const Color brandSalmon = Color(0xFFFFA3AF);
  static const Color brandGreen = Color(0xFF99D16E);
  static const Color brandPrimary = Color(0xFFDF2B50); // Дублює primaryColor
  
  // Градієнти
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFDF2B50), Color(0xFFFF5C7F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Відступи
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;
  
  // Радіуси скруглення
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  
  // Розміри іконок
  static const double iconSizeXS = 12.0;
  static const double iconSizeS = 16.0;
  static const double iconSizeM = 24.0;
  static const double iconSizeL = 32.0;
  static const double iconSizeXL = 48.0;
  
  // Висоти елементів
  static const double buttonHeight = 48.0;
  static const double inputHeight = 56.0;
  static const double cardHeight = 80.0;
  static const double appBarHeight = 60.0;
  
  // Тіні
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];
  
  // Стилі тексту
  static const TextStyle displayLargeStyle = TextStyle(
    fontFamily: 'DrukCyr',
    fontSize: 52,
    fontWeight: FontWeight.w500,
    letterSpacing: 2.0,
    color: textPrimaryColor,
  );
  
  static const TextStyle titleLargeStyle = TextStyle(
    fontFamily: 'GrtskGiga',
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: -1.67,
    color: textPrimaryColor,
  );
  
  static const TextStyle titleMediumStyle = TextStyle(
    fontFamily: 'GrtskGiga',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
    color: textPrimaryColor,
  );
  
  static const TextStyle bodyLargeStyle = TextStyle(
    fontFamily: 'ObjectSans',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.5,
    color: textPrimaryColor,
  );
  
  static const TextStyle bodyMediumStyle = TextStyle(
    fontFamily: 'ObjectSans',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textPrimaryColor,
  );
  
  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'ObjectSans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
    color: backgroundColor,
  );
  
  // Стилі кнопок
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: backgroundColor,
    minimumSize: const Size(double.infinity, buttonHeight),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusM),
    ),
    textStyle: buttonTextStyle,
  );
  
  static final ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    side: const BorderSide(color: primaryColor),
    minimumSize: const Size(double.infinity, buttonHeight),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusM),
    ),
    textStyle: buttonTextStyle.copyWith(color: primaryColor),
  );
  
  // Стилі карток
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: backgroundColor,
    borderRadius: BorderRadius.circular(radiusM),
    boxShadow: cardShadow,
  );
  
  // Стилі полів вводу
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: backgroundColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: paddingM, vertical: paddingS),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radiusM),
      borderSide: const BorderSide(color: dividerColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radiusM),
      borderSide: const BorderSide(color: dividerColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radiusM),
      borderSide: const BorderSide(color: primaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radiusM),
      borderSide: const BorderSide(color: errorColor),
    ),
    hintStyle: bodyMediumStyle.copyWith(color: textSecondaryColor),
  );
}