import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Константы вынесены в отдельный класс для удобства использования
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
    final titleLargeFontSize = theme.textTheme.titleLarge?.fontSize ?? 18.0;
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
                    _buildProgressAvatar(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Имя пользователя с эллипсисом при переполнении
                          Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'ObjectSans',
                              fontSize: isSmallScreen
                                  ? titleLargeFontSize * 0.85
                                  : titleLargeFontSize,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          // Счетчик сердец
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                heartCount.toString(),
                                style: TextStyle(
                                  fontFamily: 'GrtskGiga',
                                  fontSize: isSmallScreen
                                      ? titleLargeFontSize * 0.85
                                      : titleLargeFontSize,
                                ),
                              ),
                              const SizedBox(width: AppStyles.smallSpacing),
                              SvgPicture.asset(
                                'assets/icons/selected_heard.svg',
                                width: AppStyles.iconSizeSmall,
                                height: AppStyles.iconSizeSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: isSmallScreen
                  ? AppStyles.smallSpacing
                  : AppStyles.mediumSpacing),

              // Кнопка диагностики
              _DiagnosticsButton(
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

  // Выделен метод для создания аватара с прогрессом
  Widget _buildProgressAvatar({
    required double avatarRadius,
    required double avatarBorderWidth,
    required Color progressColor,
    required int progressValue,
    String? avatarAsset,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Круговой индикатор прогресса
        SizedBox(
          width: avatarRadius * 2 + avatarBorderWidth * 2,
          height: avatarRadius * 2 + avatarBorderWidth * 2,
          child: CircularProgressIndicator(
            value: progressValue / 100,
            strokeWidth: avatarBorderWidth,
            backgroundColor: AppStyles.grey200,
            color: progressColor,
          ),
        ),

        // Аватар пользователя
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: AppStyles.grey200,
          foregroundImage: avatarAsset != null
              ? AssetImage(avatarAsset)
              : const AssetImage('assets/images/avatar.png'),
          backgroundImage: null,
          child: progressValue > 70
              ? null
              : Text(
            '$progressValue%',
            style: const TextStyle(
              fontSize: AppStyles.progressFontSize,
              color: AppStyles.black,
            ),
          ),
        ),
      ],
    );
  }
}

// Выделен в отдельный виджет для лучшей организации кода
class _DiagnosticsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double horizontalPadding;
  final double verticalPadding;
  final bool isCompact;

  const _DiagnosticsButton({
    required this.onPressed,
    required this.horizontalPadding,
    required this.verticalPadding,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppStyles.red,
        foregroundColor: AppStyles.white,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.buttonBorderRadius),
        ),
      ),
      icon: SvgPicture.asset(
        'assets/icons/diagnostics.svg',
        width: isCompact ? AppStyles.iconSizeSmall : AppStyles.iconSizeMedium,
        height: isCompact ? AppStyles.iconSizeSmall : AppStyles.iconSizeMedium,
      ),
      label: Text(
        'Диагностика',
        style: TextStyle(
          fontSize: isCompact ? 13 : 14,
        ),
      ),
    );
  }
}