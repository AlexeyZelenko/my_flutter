import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'button_icon.dart';
import 'button_text.dart';

/// Компонент стилизованной кнопки с иконкой и текстом
class StyledButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback? onPressed;

  const StyledButton({
    super.key,
    required this.text,
    required this.iconPath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: SizedBox(
          height: 60.0,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(64),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ButtonIcon(iconPath: iconPath),
                const SizedBox(width: 8),
                ButtonText(text: text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}