import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons

class StatsRowWidget extends StatelessWidget {
  const StatsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            context,
            iconPath: 'assets/icons/shopping-basket.svg',
            count: '70',
            label: 'Мои заказы',
          ),
          _buildStatItem(
            context,
            iconPath: 'assets/icons/shopping-basket-line.svg',
            count: '3',
            label: 'Корзина',
          ),
          _buildStatItem(
            context,
            iconPath: 'assets/icons/heart.svg',
            count: '22',
            label: 'Избранное',
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, {
    required String iconPath,
    required String count,
    required String label,
  }) {
    const double cardWidth = 120;
    const double cardHeight = 84;
    const double borderRadius = 24.0;
    const double padding = 16.0;
    const Color textColor = Colors.black54;
    const Color iconColor = Colors.black54;
    const Color cardBackgroundColor = Colors.white;

    final TextStyle commonTextStyle = TextStyle(
      fontFamily: 'ObjectSans',
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      height: 1.0, // 100%
      letterSpacing: 0.0,
    );

    final TextStyle countTextStyle = TextStyle(
      fontFamily: 'GolosText',
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      height: 1.2, // 120%
      letterSpacing: 0.0,
      color: Theme.of(context).primaryColorDark ?? Colors.black87,
    );

    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
              Text(
                count,
                style: countTextStyle,
              ),
            ],
          ),
          Text(
            label,
            style: commonTextStyle.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}