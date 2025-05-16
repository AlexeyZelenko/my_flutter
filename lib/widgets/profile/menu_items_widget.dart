import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItemsWidget extends StatelessWidget {
  const MenuItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder colors and styles
    const Color iconColor = Colors.black54;
    const Color textColor = Colors.black87;
    const Color logoutTextColor = Colors.redAccent;

    final List<Map<String, dynamic>> menuItems = [
      {
        'iconPath': 'assets/icons/profile/chart.svg',
        'text': 'Динамика результатов',
        'onTap': () { print('Динамика результатов tapped'); },
        'isLogout': false,
      },
      {
        'iconPath': 'assets/icons/profile/thumb_up.svg',
        'text': 'Персональные рекомендации',
        'onTap': () { print('Персональные рекомендации tapped'); },
        'isLogout': false,
      },
      {
        'iconPath': 'assets/icons/profile/info.svg',
        'text': 'О приложении',
        'onTap': () { print('О приложении tapped'); },
        'isLogout': false,
      },
      {
        'iconPath': 'assets/icons/profile/exit.svg',
        'text': 'Выйти из аккаунта',
        'onTap': () { print('Выйти из аккаунта tapped'); },
        'isLogout': true,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: menuItems.map((item) {
          return ListTile(
            leading: SvgPicture.asset(
              item['iconPath'] as String,
              colorFilter: ColorFilter.mode(
                item['isLogout'] as bool ? logoutTextColor : iconColor,
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
            ),
            title: Text(
              item['text'] as String,
              style: TextStyle(
                fontSize: 15,
                color: item['isLogout'] as bool ? logoutTextColor : textColor,
                fontWeight: item['isLogout'] as bool ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
            onTap: item['onTap'] as void Function()?,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          );
        }).toList(),
      ),
    );
  }
}