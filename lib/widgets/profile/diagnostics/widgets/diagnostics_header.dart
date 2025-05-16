import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'expand_button.dart';

class DiagnosticsHeader extends StatelessWidget {
  final String icon;
  final String title;

  const DiagnosticsHeader({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // Иконка слева
        Padding(
          padding: const EdgeInsets.only(right: 8, top: 15),
          child: SvgPicture.asset(
            icon,
            width: 16,
            height: 16,
          ),
        ),

        // Заголовок по центру
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'GrtskGiga',
                fontWeight: FontWeight.w500,
                fontSize: 19,
                letterSpacing: -1.66,
                height: 1.09,
                color: Colors.black,
              ),
            ),
          ),
        ),

        // Красная кнопка со стрелкой
        const Positioned(
          top: 0,
          right: 0,
          child: ExpandButton(),
        ),
      ],
    );
  }
}