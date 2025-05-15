import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Made NavItem public by removing underscore and exporting it implicitly
// No explicit export needed as it's in the same library and imported by main_screen.dart

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
          NavItem(
            svgIconPath: 'assets/icons/home.svg',
            label: 'Главная',
            // isActive and onTap will be managed by the screen using BottomNavigation if needed,
            // or this widget remains a simple presentational component.
          ),
          NavItem(
            svgIconPath: 'assets/icons/study.svg',
            label: 'Обучение',
          ),
          NavItem(
            svgIconPath: 'assets/icons/vector.svg',
            label: 'Помощник',
            isActive: true, // Example: if BottomNavigation itself manages state
          ),
          NavItem(
            svgIconPath: 'assets/icons/shopping.svg',
            label: 'Магазин',
          ),
          NavItem(
            svgIconPath: 'assets/icons/user.svg',
            label: 'Профиль',
            onTap: () {
              // This onTap is for the NavItem within BottomNavigation.
              // If BottomNavigation is used as a whole, its parent (e.g., MainScreen)
              // would handle the navigation logic by passing callbacks or managing index.
              // The current setup in MainScreen bypasses using BottomNavigation directly
              // and reconstructs the nav items, so this specific onTap might be redundant
              // if BottomNavigation is not used as a standalone widget with its own logic anymore.
              print('Профиль tapped from BottomNavigation NavItem. Navigation to be implemented by parent.');
            },
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String? svgIconPath;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const NavItem({
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
      height: 1.2, // 120%
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