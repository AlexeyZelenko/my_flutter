import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './components/avatar_block.dart';
import './constants/colors.dart';
import './constants/typography.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String userName;
  final String score;
  final String starsCount;
  final ImageProvider? avatarImage;

  const ProfileHeaderWidget({
    super.key,
    required this.userName,
    required this.score,
    required this.starsCount,
    this.avatarImage,
  });

  @override
  Widget build(BuildContext context) {
    // Размеры контейнера без привязки к ширине экрана
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 290, // Фиксированная ширина всего компонента
        height: 137,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            // Единая информационная полоска
            Positioned(
              top: 45, // Половина высоты аватара для перекрытия
              child: Container(
                width: 290,
                height: 28,
                margin: const EdgeInsets.only(left: 25),
                decoration: BoxDecoration(
                  color: ProfileHeaderColors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Левая часть - меньше (например, flex: 1)
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/heart_grey_selected.svg',
                              width: 16,
                              height: 16,
                              colorFilter: const ColorFilter.mode(
                                ProfileHeaderColors.grayMedium,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              score,
                              style: ProfileHeaderTypography.scoreTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Правая часть - шире (например, flex: 2)
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              starsCount,
                              style: ProfileHeaderTypography.scoreTextStyle,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              'звёзд',
                              style: TextStyle(
                                fontFamily: ProfileHeaderTypography.objectSans,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: ProfileHeaderColors.grayDark,
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: ProfileHeaderColors.red,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/star.svg',
                                width: 14,
                                height: 14,
                                fit: BoxFit.scaleDown,
                                colorFilter: const ColorFilter.mode(
                                  ProfileHeaderColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),

            // Аватар сверху по центру
            Positioned(
              top: 15,
              child: AvatarBlock(
                name: userName,
                avatarImage: avatarImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}