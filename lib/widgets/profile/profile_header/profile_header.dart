import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './components/info_box.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 32;
    final avatarCenterX = containerWidth / 2;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: containerWidth,
        height: 137,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Left Info Box (Score)
            Positioned(
              top: 38,
              left: avatarCenterX - 70/2 - 10 - 92,
              child: InfoBox(
                width: 92,
                height: 28,
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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

            // Right Info Box (Stars)
            Positioned(
              top: 38,
              right: 40,
              child: InfoBox(
                width: 113,
                height: 28,
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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

            // Central Avatar Block
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 9),
                child: AvatarBlock(
                  name: userName,
                  avatarImage: avatarImage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}