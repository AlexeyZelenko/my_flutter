import 'package:flutter/material.dart';

/// Компонент для отображения фонового изображения видео
class VideoBackgroundImage extends StatelessWidget {
  final String imagePath;

  const VideoBackgroundImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Добавляем скругление углов
        child: Image.asset(
          imagePath,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain, // Изменяем на contain, чтобы изображение не обрезалось
        ),
      ),
    );
  }
}