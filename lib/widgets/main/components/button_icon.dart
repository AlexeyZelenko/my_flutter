import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Компонент для отображения иконки кнопки
class ButtonIcon extends StatelessWidget {
  final String iconPath;
  final double size;

  const ButtonIcon({
    super.key,
    required this.iconPath,
    this.size = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    final isSvg = iconPath.toLowerCase().endsWith('.svg');
    
    return isSvg
        ? SvgPicture.asset(
            iconPath,
            width: size,
            height: size,
          )
        : ImageIcon(AssetImage(iconPath), size: size);
  }
}