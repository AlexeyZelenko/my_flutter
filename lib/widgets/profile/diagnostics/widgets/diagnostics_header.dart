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
    return SizedBox(
      height: 60,
      child: Stack(
        children: [

          Positioned(
            top: 2,
            left: 0,
            child: SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
            ),
          ),

          Positioned(
            top: 18,
            left: 0,
            right: 0,
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

          const Positioned(
            top: 2,
            right: 0,
            child: ExpandButton(),
          ),
        ],
      ),
    );
  }
}