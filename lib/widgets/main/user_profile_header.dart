import 'package:flutter/material.dart';
import 'package:myapp/theme/app_styles.dart';
import 'package:myapp/widgets/animations/fade_in_animation.dart';
import 'components/progress_avatar.dart';
import 'components/user_info.dart';
import 'components/diagnostics_button.dart';

/// Компонент заголовка профиля пользователя для главного экрана
class UserProfileHeader extends StatelessWidget {
  final String name;
  final int heartCount;
  final int progressValue;
  final String? avatarAsset;
  final VoidCallback onDiagnosticsPressed;

  // Константы для отступов
  static const double _defaultPadding = 16.0;
  static const double _mediumSpacing = 12.0;
  static const double _smallSpacing = 8.0;
  static const double _normalSpacing = 16.0;

  // Константы для аватара
  static const double _defaultAvatarRadius = 24.0;
  static const double _defaultAvatarBorderWidth = 2.0;

  const UserProfileHeader({
    super.key,
    this.name = 'Екатерина',
    this.heartCount = 8,
    this.progressValue = 85,
    this.avatarAsset,
    required this.onDiagnosticsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final screenSize = MediaQuery.of(context).size;

    // Адаптивные размеры аватара
    final avatarRadius = _defaultAvatarRadius;
    final avatarBorderWidth = _defaultAvatarBorderWidth;

    // Определяем цвет прогресса в зависимости от значения
    final progressColor = progressValue >= 70 ? Colors.red : primaryColor;

    // Адаптивные отступы
    final isSmallScreen = screenSize.width < 400;
    final horizontalPadding = screenSize.width < 360
        ? _mediumSpacing
        : _defaultPadding;

    // Уменьшаем размер кнопки на маленьких экранах
    final buttonPaddingHorizontal = isSmallScreen ? 10.0 : 16.0;
    final buttonPaddingVertical = isSmallScreen ? 8.0 : 12.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: _defaultPadding,
      ),
      child: FadeInAnimation(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutQuint,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Аватар и информация пользователя
            Expanded(
              child: Row(
                children: [
                  // Компонент аватара с прогрессом и анимацией
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.elasticOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: ProgressAvatar(
                          avatarRadius: avatarRadius,
                          avatarBorderWidth: avatarBorderWidth,
                          progressColor: progressColor,
                          progressValue: (progressValue * value).toInt(), // Преобразуем в int
                          avatarAsset: avatarAsset,
                        ),
                      );
                    },
                  ),

                  SizedBox(width: isSmallScreen
                      ? _mediumSpacing
                      : _normalSpacing),

                  // Информация о пользователе
                  Expanded(
                    child: UserInfo(
                      name: name,
                      heartCount: heartCount,
                      isSmallScreen: isSmallScreen,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: isSmallScreen
                ? _smallSpacing
                : _mediumSpacing),

            // Кнопка диагностики
            DiagnosticsButton(
              onPressed: onDiagnosticsPressed,
              horizontalPadding: buttonPaddingHorizontal,
              verticalPadding: buttonPaddingVertical,
              isCompact: isSmallScreen,
            ),
          ],
        ),
      ),
    );
  }
}