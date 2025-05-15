import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  // Colors constants
  static const Color _whiteColor = Color(0xFFFFFFFF);
  static const Color _redColor = Color(0xFFDF2B50);
  static const Color _grayMediumColor = Color(0xFFABB2B6);
  static const Color _grayDarkColor = Color(0xFF2E3F49);
  static const Color _blackColor = Color(0xFF000000);
  static const Color _widgetBackgroundColor = Color(0xFFF0F8FF);

  // Font constants
  static const String _fontGrtskGiga = 'GrtskGiga';
  static const String _fontObjectSans = 'ObjectSans';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 32; // Accounting for horizontal padding
    final avatarCenterX = containerWidth / 2;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0), // Added top and bottom padding
      child: SizedBox(
        width: containerWidth,
        height: 137,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Left Info Box (8/10)
            Positioned(
              top: 38,
              left: avatarCenterX - 70/2 - 10 - 92, // Position relative to screen width
              child: _buildInfoBox(
                width: 92,
                height: 28,
                backgroundColor: _whiteColor,
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(15)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: _grayMediumColor, size: 16),
                    SizedBox(width: 3),
                    Text(
                      '8/10',
                      style: TextStyle(
                        fontFamily: _fontGrtskGiga,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: _grayDarkColor,
                        height: 1.09,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // Right Info Box (25 звёзд)
            Positioned(
              top: 38,
              right: 40, // Position from right edge for better responsiveness
              child: _buildInfoBox(
                width: 113,
                height: 28,
                backgroundColor: _whiteColor,
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '25',
                      style: TextStyle(
                        fontFamily: _fontGrtskGiga,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: _grayDarkColor,
                        height: 1.09,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'звёзд',
                      style: TextStyle(
                        fontFamily: _fontObjectSans,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: _grayDarkColor,
                        height: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: _redColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.star, color: _whiteColor, size: 14),
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
                child: SizedBox(
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
                            // Progress Ring
                            const SizedBox(
                              width: 87,
                              height: 87,
                              child: CircularProgressIndicator(
                                value: 0.8,
                                strokeWidth: 4,
                                backgroundColor: Color(0xFFE0E0E0),
                                valueColor: AlwaysStoppedAnimation<Color>(_redColor),
                              ),
                            ),
                            // White border for avatar
                            Container(
                              width: 79,
                              height: 79,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: _whiteColor,
                              ),
                            ),
                            // Avatar Image
                            CircleAvatar(
                              radius: 39,
                              backgroundColor: Colors.grey[300],
                              child: Icon(Icons.person, size: 40, color: Colors.grey[600]),
                            ),
                            // Edit Button
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  color: _redColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.edit, color: _whiteColor, size: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // User Name
                      const Text(
                        'ЕКАТЕРИНА',
                        style: TextStyle(
                          fontFamily: _fontGrtskGiga,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: _blackColor,
                          height: 1.09,
                          letterSpacing: -1.67,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox({
    required double width,
    required double height,
    required Color backgroundColor,
    required BorderRadius borderRadius,
    required Widget child,
  }) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ]
      ),
      child: Center(child: child),
    );
  }
}