import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons if used

class StatsRowWidget extends StatelessWidget {
  const StatsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder colors and styles
    const Color cardBackgroundColor = Colors.white;
    const Color textColor = Colors.black54;
    const Color iconColor = Colors.black54;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            context,
            iconPath: 'assets/icons/orders_placeholder.svg', // Placeholder
            count: '70',
            label: 'Мои заказы',
            iconColor: iconColor,
            textColor: textColor,
            cardBackgroundColor: cardBackgroundColor,
          ),
          _buildStatItem(
            context,
            iconPath: 'assets/icons/cart_placeholder.svg', // Placeholder
            count: '3',
            label: 'Корзина',
            iconColor: iconColor,
            textColor: textColor,
            cardBackgroundColor: cardBackgroundColor,
          ),
          _buildStatItem(
            context,
            iconPath: 'assets/icons/favorites_placeholder.svg', // Placeholder
            count: '22',
            label: 'Избранное',
            iconColor: iconColor,
            textColor: textColor,
            cardBackgroundColor: cardBackgroundColor,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, {
    required String iconPath,
    required String count,
    required String label,
    required Color iconColor,
    required Color textColor,
    required Color cardBackgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Using a placeholder Icon for now, replace with SvgPicture.asset(iconPath) if you have SVGs
          Icon(Icons.shopping_bag_outlined, color: iconColor, size: 24), // Placeholder icon
          // SvgPicture.asset(iconPath, color: iconColor, width: 24, height: 24),
          const SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark, // Or a specific color
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}