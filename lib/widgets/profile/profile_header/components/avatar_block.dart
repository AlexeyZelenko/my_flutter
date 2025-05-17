import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';
import '../constants/typography.dart';
import 'progress_ring.dart';
import '../../../../widgets/animations/fade_in_animation.dart';
import '../../../../widgets/animations/animated_button.dart';

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
    // Используем MediaQuery для определения размера экрана
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    // Адаптивные размеры блоков
    final blockWidth = isTablet ? 140.0 : 124.0;

    return FadeInAnimation(
      // Добавляем анимацию появления с небольшой задержкой
      delay: const Duration(milliseconds: 200),
      offset: const Offset(0, 20),
      child: SizedBox(
        width: blockWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Контейнер для аватара и кнопки редактирования
            SizedBox(
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
                  // Edit button - улучшенное позиционирование с анимацией
                  Positioned(
                    right: isTablet ? 0 : -2, // Корректируем позицию для планшетов и маленьких экранов
                    bottom: isTablet ? 0 : -2, // Корректируем позицию для планшетов и маленьких экранов
                    child: AnimatedButton(
                      scaleDown: 0.9,
                      duration: const Duration(milliseconds: 100),
                      onPressed: () {},
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Улучшенный контейнер для текста с ограничением по ширине
            SizedBox(
              width: blockWidth,
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
      ),
    );
  }
}