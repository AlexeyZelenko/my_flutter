import 'package:flutter/material.dart';
import 'colors.dart';

class ProfileHeaderTypography {
  static const String grtskGiga = 'GrtskGiga';
  static const String objectSans = 'ObjectSans';

  static final TextStyle nameTextStyle = const TextStyle(
    fontFamily: grtskGiga,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: ProfileHeaderColors.black,
    height: 1.09,
    letterSpacing: -1.67,
  );

  static final TextStyle scoreTextStyle = const TextStyle(
    fontFamily: grtskGiga,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: ProfileHeaderColors.grayDark,
    height: 1.09,
  );
}