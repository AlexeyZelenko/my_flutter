import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color _grey200 = Color(0xFFEEEEEE);
const Color _redColor =  Color(0xFFDF2B50);

const Color _transparentColor = Colors.transparent;
const Color _whiteColor = Colors.white;
const Color _blackColor = Colors.black;

const double _paddingAll = 16.0;
const double _sizedBoxWidth = 12.0;
const double _iconSizeSmall = 16.0;
const double _iconSizeMedium = 20.0;
const double _buttonPaddingHorizontal = 16.0;
const double _buttonPaddingVertical = 12.0;
const double _buttonBorderRadius = 30.0;
const double _progressFontSize = 12.0;
const double _avatarRadius = 26.0;
const double _avatarBorderWidth = 2.0;

const int _progressValue = 85;

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final titleLargeFontSize = Theme.of(context).textTheme.titleLarge?.fontSize;
    final primaryColor = Theme.of(context).primaryColor;

    // Determine progress color based on value
    final progressColor = _progressValue >= 70 ? _redColor : primaryColor;

    return Padding(
      padding: const EdgeInsets.all(_paddingAll),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Circular progress indicator
                  SizedBox(
                    width: _avatarRadius * 2 + _avatarBorderWidth * 2,
                    height: _avatarRadius * 2 + _avatarBorderWidth * 2,
                    child: CircularProgressIndicator(
                      value: _progressValue / 100,
                      strokeWidth: _avatarBorderWidth,
                      backgroundColor: _grey200,
                      color: progressColor,
                    ),
                  ),
                  // Avatar
                  CircleAvatar(
                    radius: _avatarRadius,
                    backgroundColor: _grey200,
                    foregroundImage: const AssetImage('assets/images/avatar.png'),
                    backgroundImage: null,
                    child: _progressValue > 70
                        ? null
                        : Text(
                      '$_progressValue%',
                      style: const TextStyle(
                        fontSize: _progressFontSize,
                        color: _blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: _sizedBoxWidth),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Екатерина',
                    style: TextStyle(
                      fontFamily: 'ObjectSans',
                      fontSize: titleLargeFontSize,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '8',
                        style: TextStyle(
                          fontFamily: 'GrtskGiga',
                          fontSize: titleLargeFontSize,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/icons/selected_heard.svg',
                        width: _iconSizeSmall,
                        height: _iconSizeSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: _redColor,
              foregroundColor: _whiteColor,
              padding: const EdgeInsets.symmetric(
                horizontal: _buttonPaddingHorizontal,
                vertical: _buttonPaddingVertical,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_buttonBorderRadius),
              ),
            ),
            icon: SvgPicture.asset(
              'assets/icons/diagnostics.svg',
              width: _iconSizeMedium,
              height: _iconSizeMedium
            ),
            label: const Text('Диагностика'),
          ),
        ],
      ),
    );
  }
}