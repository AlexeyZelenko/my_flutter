import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem extends StatelessWidget {
  final String? svgIconPath;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const NavItem({
    super.key,
    this.svgIconPath,
    required this.label,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = TextStyle(
      fontFamily: 'ObjectSans',
      fontWeight: FontWeight.w400,
      fontSize: 9.0,
      height: 1.2,
      letterSpacing: 0.0,
      color: Colors.white.withOpacity(isActive ? 1 : 0.6),
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
            if (svgIconPath != null)
              SvgPicture.asset(
                svgIconPath!,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 20,
                height: 20,
              ),
            const SizedBox(height: 4),
            Text(
              label,
              style: labelStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}