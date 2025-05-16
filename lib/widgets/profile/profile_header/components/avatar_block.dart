import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Імпортуйте flutter_svg
import '../constants/colors.dart';
import '../constants/typography.dart';
import 'progress_ring.dart';
import '../constants/colors.dart';

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
    return SizedBox(
      width: 124,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 87,
            height: 87,
            child: Stack(
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
                // Edit button
                Positioned(
                  right: 0,
                  bottom: 0,
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
          Text(
            name.toUpperCase(),
            style: ProfileHeaderTypography.nameTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}