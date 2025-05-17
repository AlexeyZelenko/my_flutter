import 'package:flutter/material.dart';
import 'video_background_image.dart';
import 'video_play_button.dart';
import 'video_title.dart';
import 'pagination_indicator.dart';

/// Компонент для отображения карточки видео
class VideoCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int currentPage;
  final int totalPages;
  final VoidCallback onPlayTap;

  const VideoCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.currentPage,
    required this.totalPages,
    required this.onPlayTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),      
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Фоновое изображение
          VideoBackgroundImage(imagePath: imagePath),

          // Кнопка воспроизведения и заголовок
          Stack(
            children: [
              // Кнопка воспроизведения
              VideoPlayButton(onTap: onPlayTap),

              // Заголовок видео
              VideoTitle(title: title),
            ],
          ),

          // Индикатор страниц
          PaginationIndicator(
            currentPage: currentPage,
            totalPages: totalPages,
          ),
        ],
      ),
    );
  }
}