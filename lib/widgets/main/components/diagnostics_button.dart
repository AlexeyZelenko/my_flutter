import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../styles/app_styles.dart';

/// Компонент кнопки диагностики с адаптивным размером
class DiagnosticsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double horizontalPadding;
  final double verticalPadding;
  final bool isCompact;

  const DiagnosticsButton({
    super.key,
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