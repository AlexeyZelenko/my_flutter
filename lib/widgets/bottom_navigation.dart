import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            svgIconPath: 'assets/icons/home.svg',
            label: 'Главная',
          ),
          _NavItem(
            svgIconPath: 'assets/icons/study.svg',
            label: 'Обучение',
          ),
          _NavItem(
            svgIconPath: 'assets/icons/vector.svg',
            label: 'Помощник',
            isActive: true,
          ),
          _NavItem(
            svgIconPath: 'assets/icons/shopping.svg',
            label: 'Магазин',
          ),
          _NavItem(
            svgIconPath: 'assets/icons/user.svg',
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String? svgIconPath;
  final String label;
  final bool isActive;

  const _NavItem({
    this.svgIconPath,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = TextStyle(
      fontFamily: 'ObjectSans',
      fontWeight: FontWeight.w400,
      fontSize: 9.0,
      height: 1.2, // 120%
      letterSpacing: 0.0,
      color: Colors.white.withOpacity(isActive ? 1 : 0.6),
    );

    return Container(
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
    );
  }
}