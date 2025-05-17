import 'package:flutter/material.dart';

/// Компонент для отображения текста кнопки со стилизацией
class ButtonText extends StatelessWidget {
  final String text;
  final double fontSize;

  const ButtonText({
    super.key,
    required this.text,
    this.fontSize = 11.0,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          fontFamily: 'ObjectSans',
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
          height: 1.0,
          letterSpacing: 0.0,
        ) ??
        TextStyle(
          fontFamily: 'ObjectSans',
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
          height: 1.0,
          letterSpacing: 0.0,
        );

    return Flexible(
      child: Text(
        text,
        style: textStyle,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}