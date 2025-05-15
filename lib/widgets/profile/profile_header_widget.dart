import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assuming SVG icons might be used for more complex shapes

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  // Colors from design
  static const Color _whiteColor = Color(0xFFFFFFFF);
  static const Color _redColor = Color(0xFFDF2B50);
  static const Color _grayMediumColor = Color(0xFFABB2B6);
  static const Color _grayDarkColor = Color(0xFF2E3F49);
  static const Color _blackColor = Color(0xFF000000);
  static const Color _widgetBackgroundColor = Color(0xFFF0F8FF); // Light blue, similar to image background

  // Font Families (ensure these are in pubspec.yaml and assets)
  static const String _fontGrtskGiga = 'Grtsk Giga';
  static const String _fontObjectSans = 'Object Sans';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 137,
      decoration: const BoxDecoration(
        color: _widgetBackgroundColor, // Background for the header area
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none, // Allow elements like edit button to overflow slightly if needed by design
        children: [
          // Left Info Box (8/10)
          Positioned(
            top: 37.59,
            // left: 375 - 227.88 - 92 = 55.12 (approx)
            // The CSS has `right: 227.88px;` for a 92px wide element in a 375px container.
            // This means its right edge is 227.88px from the container's right edge.
            // So, its left edge is (375 - 227.88 - 92) = 55.12px from container's left edge.
            left: (375 - 92) / 2 - 124 / 2 - 10 - 92, // Adjusted to be left of avatar
            child: _buildInfoBox(
              width: 92,
              height: 28,
              backgroundColor: _whiteColor,
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon from CSS: Frame 2087327441 / Subtract
                  const Icon(Icons.check, color: _grayMediumColor, size: 16), // Placeholder, CSS implies custom SVG
                  const SizedBox(width: 3),
                  const Text(
                    '8/10',
                    style: TextStyle(
                      fontFamily: _fontGrtskGiga,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: _grayDarkColor,
                      height: 1.09, // line-height: 109%
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
            left: 228, // As per CSS `left: 228px;`
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
                      height: 1.09, // line-height: 109%
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
                      height: 1.0, // line-height: 100%
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 8),
                  // Icon from CSS: Frame 2136137702 (container) / Star 1
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: _redColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.star, color: _whiteColor, size: 13.69),
                  ),
                ],
              ),
            ),
          ),

          // Central Avatar Block
          Positioned(
            top: 9,
            left: 125.5, // (375 - 124) / 2
            width: 124,
            // height: 117.75, // Column will size itself
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 86.75,
                  height: 86.75,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Progress Ring (Ellipse 28262)
                      const SizedBox(
                        width: 86.75,
                        height: 86.75,
                        child: CircularProgressIndicator(
                          value: 0.8, // 8/10
                          strokeWidth: 4, // Adjusted for visibility, CSS implies thickness
                          backgroundColor: Color(0xFFE0E0E0), // Light gray track
                          valueColor: AlwaysStoppedAnimation<Color>(_redColor),
                        ),
                      ),
                      // White border for avatar image
                      Container(
                        width: 86.75 - (2*4.09), // Outer diameter - 2*border_thickness_from_progress_to_image_edge
                        height: 86.75 - (2*4.09),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: _whiteColor,
                        ),
                      ),
                      // Avatar Image (image)
                      CircleAvatar(
                        radius: 78.05 / 2,
                        backgroundColor: Colors.grey[300], // Placeholder background
                        // backgroundImage: AssetImage('assets/images/avatar_placeholder.png'), // Placeholder image
                        child: Icon(Icons.person, size: 40, color: Colors.grey[600]), // Placeholder icon
                      ),
                      // Edit Button (Frame 2136137701)
                      Positioned(
                        // As per image, bottom right of avatar
                        // CSS: right: 144px; bottom: 18px; (relative to main frame)
                        // Avatar center X: 125.5 + 124/2 = 187.5
                        // Edit button center X: 375 - 144 - 24/2 = 219 (This is off from avatar center)
                        // For simplicity, positioning relative to avatar stack:
                        right: 0, 
                        bottom: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: _redColor,
                            shape: BoxShape.circle,
                          ),
                          // Edit icon (edit / Vector 234254362)
                          child: const Icon(Icons.edit, color: _whiteColor, size: 13.58),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // User Name (Екатерина)
                Text(
                  'ЕКАТЕРИНА'.toUpperCase(),
                  style: const TextStyle(
                    fontFamily: _fontGrtskGiga,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: _blackColor,
                    height: 1.09, // line-height: 109%
                    letterSpacing: -1.66516,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 8), // Internal padding for content
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