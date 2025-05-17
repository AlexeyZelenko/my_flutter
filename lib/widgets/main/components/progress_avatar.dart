import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

/// Компонент аватара пользователя с круговым индикатором прогресса
class ProgressAvatar extends StatelessWidget {
  final double avatarRadius;
  final double avatarBorderWidth;
  final Color progressColor;
  final int progressValue;
  final String? avatarAsset;

  const ProgressAvatar({
    super.key,
    required this.avatarRadius,
    required this.avatarBorderWidth,
    required this.progressColor,
    required this.progressValue,
    this.avatarAsset,
  });

  @override
  Widget build(BuildContext context) {
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
              ? AssetImage(avatarAsset!)
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