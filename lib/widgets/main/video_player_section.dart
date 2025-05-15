import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoPlayerSection extends StatelessWidget {
  const VideoPlayerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 246,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                _buildBackgroundImage(),

                // Overlay with Play Button
                _buildOverlayWithPlayButton(theme),

                // Pagination Indicator
                _buildPaginationIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      top: 0,
      child: ClipRRect(
        child: Image.asset(
          'assets/images/main/toothbrush.png',
        ),
      ),
    );
  }

  Widget _buildOverlayWithPlayButton(ThemeData theme) {
    return Positioned.fill(
      top: 60,
      child: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  debugPrint('Play button tapped');
                },
                child: Container(
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/play_video.svg'
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 75,
                child: Text(
                  '3 минуты с пользой',
                  style: TextStyle(
                    fontFamily: 'Object Sans',
                    fontSize: 16.0,
                    height: 1.1,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaginationIndicator() {
    return Positioned(
      bottom: 0,
      right: 16,
      child: Row(
        children: const [
          _PaginationDot(isActive: false),
          SizedBox(width: 4),
          _PaginationDot(isActive: true),
          SizedBox(width: 4),
          _PaginationDot(isActive: false),
        ],
      ),
    );
  }
}

class _PaginationDot extends StatelessWidget {
  final bool isActive;

  const _PaginationDot({
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 10 : 4,
      height: isActive ? 10 : 4,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}