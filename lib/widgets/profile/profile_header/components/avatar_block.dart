import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';
import '../constants/typography.dart';
import 'progress_ring.dart';

class AvatarBlock extends StatelessWidget {
  final String name;
  final ImageProvider? avatarImage;

  const AvatarBlock({
    super.key,
    required this.name,
    this.avatarImage,
  });

  @override
  Widget build(BuildContext context) {
    // Используем LayoutBuilder для адаптации под разные размеры экрана
    return LayoutBuilder(
      builder: (context, constraints) {
        // Определяем, является ли устройство планшетом
        final isTablet = MediaQuery.of(context).size.width >= 600;

        return Container(
          // Адаптивная ширина вместо фиксированной
          width: isTablet ? 140 : 124,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Контейнер для аватара и кнопки редактирования
              Container(
                width: 87,
                height: 87,
                child: Stack(
                  clipBehavior: Clip.none, // Предотвращает обрезание дочерних элементов
                  alignment: Alignment.center,
                  children: [
                    const ProgressRing(),
                    // White border
                    Container(
                      width: 79,
                      height: 79,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ProfileHeaderColors.white,
                      ),
                    ),
                    // Avatar
                    CircleAvatar(
                      radius: 39,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: avatarImage,
                      child: avatarImage == null
                          ? const Icon(Icons.person, size: 40, color: ProfileHeaderColors.grayDark)
                          : null,
                    ),
                    // Edit button - улучшенное позиционирование
                    Positioned(
                      right: isTablet ? 0 : -2, // Корректируем позицию для планшетов и маленьких экранов
                      bottom: isTablet ? 0 : -2, // Корректируем позицию для планшетов и маленьких экранов
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: ProfileHeaderColors.red,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/edit.svg',
                          width: 12,
                          height: 12,
                          fit: BoxFit.scaleDown,
                          colorFilter: const ColorFilter.mode(
                            ProfileHeaderColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Улучшенный контейнер для текста с ограничением по ширине
              Container(
                width: isTablet ? 140 : 124,
                child: Text(
                  name.toUpperCase(),
                  style: ProfileHeaderTypography.nameTextStyle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}