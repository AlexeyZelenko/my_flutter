import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem extends StatelessWidget {
  final String inactiveSvgIconPath;
  final String activeSvgIconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.inactiveSvgIconPath,
    required this.activeSvgIconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = isActive ? Colors.white : Colors.white.withOpacity(0.6);
    final String currentIconPath = isActive ? activeSvgIconPath : inactiveSvgIconPath;

    final TextStyle labelStyle = TextStyle(
      fontFamily: 'ObjectSans',
      fontWeight: FontWeight.w400,
      fontSize: 9.0,
      height: 1.2,
      letterSpacing: 0.0,
      color: textColor,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              currentIconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: labelStyle,
            ),
          ],
        ),
      ),
    );
  }
}