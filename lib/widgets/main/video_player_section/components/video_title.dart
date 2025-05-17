import 'package:flutter/material.dart';

/// Компонент для отображения заголовка видео
class VideoTitle extends StatelessWidget {
  final String title;

  const VideoTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: SizedBox(
        width: 120,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'ObjectSans',
            fontSize: 16.0,
            height: 1.1,
            letterSpacing: -0.5,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}