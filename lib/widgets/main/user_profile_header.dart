import 'package:flutter/material.dart';
import 'styles/app_styles.dart';
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

    // Адаптивные размеры аватара
    final avatarRadius = AppStyles.getAvatarRadius(context);
    final avatarBorderWidth = AppStyles.getAvatarBorderWidth(context);

    // Определяем цвет прогресса в зависимости от значения
    final progressColor = progressValue >= 70 ? AppStyles.red : primaryColor;

    // Адаптивные отступы
    final horizontalPadding = MediaQuery.of(context).size.width < 360
        ? AppStyles.mediumSpacing
        : AppStyles.defaultPadding;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: AppStyles.defaultPadding,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Используем LayoutBuilder для определения доступного пространства
          final availableWidth = constraints.maxWidth;
          final isSmallScreen = availableWidth < 400;

          // Уменьшаем размер кнопки на маленьких экранах
          final buttonPaddingHorizontal = isSmallScreen ? 10.0 : 16.0;
          final buttonPaddingVertical = isSmallScreen ? 8.0 : 12.0;

          // Компактный вид на маленьких экранах
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Аватар и информация пользователя
              Expanded(
                child: Row(
                  children: [
                    // Компонент аватара с прогрессом
                    ProgressAvatar(
                      avatarRadius: avatarRadius,
                      avatarBorderWidth: avatarBorderWidth,
                      progressColor: progressColor,
                      progressValue: progressValue,
                      avatarAsset: avatarAsset,
                    ),

                    SizedBox(width: isSmallScreen
                        ? AppStyles.mediumSpacing
                        : AppStyles.normalSpacing),

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
                  ? AppStyles.smallSpacing
                  : AppStyles.mediumSpacing),

              // Кнопка диагностики
              DiagnosticsButton(
                onPressed: onDiagnosticsPressed,
                horizontalPadding: buttonPaddingHorizontal,
                verticalPadding: buttonPaddingVertical,
                isCompact: isSmallScreen,
              ),
            ],
          );
        },
      ),
    );
  }
}