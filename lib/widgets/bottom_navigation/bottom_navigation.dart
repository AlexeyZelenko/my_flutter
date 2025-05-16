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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _buildNavItem(0, 'assets/icons/menu_bottom/home.svg', 'assets/icons/menu_bottom/home_active.svg', 'Главная'),
          ),
          Expanded(
            child: _buildNavItem(1, 'assets/icons/menu_bottom/study.svg', 'assets/icons/menu_bottom/study_active.svg', 'Обучение'),
          ),
          Expanded(
            child: _buildNavItem(2, 'assets/icons/menu_bottom/vector.svg', 'assets/icons/menu_bottom/vector_active.svg', 'Помощник'),
          ),
          Expanded(
            child: _buildNavItem(3, 'assets/icons/menu_bottom/shopping.svg', 'assets/icons/menu_bottom/shopping_active.svg', 'Магазин'),
          ),
          Expanded(
            child: _buildNavItem(4, 'assets/icons/menu_bottom/user.svg', 'assets/icons/menu_bottom/user_active.svg', 'Профиль'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      int index,
      String inactiveIconPath,
      String activeIconPath,
      String label,
      ) {
    return NavItem(
      inactiveSvgIconPath: inactiveIconPath,
      activeSvgIconPath: activeIconPath,
      label: label,
      isActive: currentIndex == index,
      onTap: () => onTap(index),
    );
  }
}