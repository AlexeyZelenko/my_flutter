import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WideCardSection extends StatelessWidget {
  const WideCardSection({super.key});

  Widget _buildStyledButton({
    required String text,
    required String iconPath,
    required BuildContext context,
    VoidCallback? onPressed,
  }) {
    final isSvg = iconPath.toLowerCase().endsWith('.svg');
    final iconWidget = isSvg
        ? SvgPicture.asset(
      iconPath,
      width: 20, // Уменьшил размер иконки
      height: 20, // Уменьшил размер иконки
    )
        : ImageIcon(AssetImage(iconPath), size: 20);

    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontFamily: 'ObjectSans',
      fontWeight: FontWeight.w400,
      fontSize: 11.0, // Уменьшил размер шрифта
      height: 1.0,
      letterSpacing: 0.0,
    ) ??
        const TextStyle(
          fontFamily: 'ObjectSans',
          fontWeight: FontWeight.w400,
          fontSize: 11.0, // Уменьшил размер шрифта
          height: 1.0,
          letterSpacing: 0.0,
        );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0), // Уменьшил горизонтальный отступ
        child: SizedBox(
          height: 60.0,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0), // Уменьшил горизонтальные отступы
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(64),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // Минимальный размер по горизонтали
              children: [
                iconWidget,
                const SizedBox(width: 8), // Уменьшил расстояние между иконкой и текстом
                Flexible(
                  child: Text(
                    text,
                    style: textStyle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis, // Добавил обрезание текста при переполнении
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 45.0), // Уменьшил горизонтальные отступы
      child: Row(
        mainAxisSize: MainAxisSize.max, // Максимальный размер по ширине
        children: [
          _buildStyledButton(
            text: 'Запись к врачу',
            iconPath: 'assets/icons/appointment_doctor.svg',
            context: context,
            onPressed: () {},
          ),
          const SizedBox(width: 4.0), // Уменьшил расстояние между кнопками
          _buildStyledButton(
            text: 'Состав продукта',
            iconPath: 'assets/icons/scanner.svg',
            context: context,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}