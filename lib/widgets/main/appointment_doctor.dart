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
      width: 24,
      height: 24,
    )
        : ImageIcon(AssetImage(iconPath));

    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontFamily: 'ObjectSans',
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      height: 1.0,
      letterSpacing: 0.0,
    ) ??
        const TextStyle(
          fontFamily: 'ObjectSans',
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          height: 1.0,
          letterSpacing: 0.0,
        );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: SizedBox(
          height: 60.0,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Зменшено відступи
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(64),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconWidget,
                const SizedBox(width: 12),
                Text(
                  text,
                  style: textStyle,
                  textAlign: TextAlign.center,
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 45.0),
      child: Row(
        children: [
          _buildStyledButton(
            text: 'Запись к врачу',
            iconPath: 'assets/icons/appointment_doctor.svg',
            context: context,
            onPressed: () {},
          ),
          const SizedBox(width: 5.0),
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