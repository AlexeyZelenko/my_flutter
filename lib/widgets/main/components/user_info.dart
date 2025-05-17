import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../styles/app_styles.dart';

/// Компонент для отображения информации о пользователе (имя и счетчик сердец)
class UserInfo extends StatelessWidget {
  final String name;
  final int heartCount;
  final bool isSmallScreen;

  const UserInfo({
    super.key,
    required this.name,
    required this.heartCount,
    this.isSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleLargeFontSize = theme.textTheme.titleLarge?.fontSize ?? 18.0;

    return Column(
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
    );
  }
}