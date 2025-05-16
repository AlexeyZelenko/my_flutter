import 'package:flutter/material.dart';
import 'nav_item.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

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
          _buildNavItem(0, 'assets/icons/home.svg', 'Главная'),
          _buildNavItem(1, 'assets/icons/study.svg', 'Обучение'),
          _buildNavItem(2, 'assets/icons/vector.svg', 'Помощник'),
          _buildNavItem(3, 'assets/icons/shopping.svg', 'Магазин'),
          _buildNavItem(4, 'assets/icons/user.svg', 'Профиль'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    return NavItem(
      svgIconPath: iconPath,
      label: label,
      isActive: currentIndex == index,
      onTap: () => onTap(index),
    );
  }
}