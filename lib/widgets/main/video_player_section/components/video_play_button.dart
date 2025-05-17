import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Компонент для отображения кнопки воспроизведения видео
class VideoPlayButton extends StatelessWidget {
  final VoidCallback onTap;

  const VideoPlayButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            'assets/icons/play_video.svg',
            width: 60,
            height: 60,
          ),
        ),
      ),
    );
  }
}