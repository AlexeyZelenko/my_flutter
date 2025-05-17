import 'package:flutter/material.dart';
import 'components/video_card.dart';

/// Секция для отображения видеоплеера с возможностью пролистывания
class VideoPlayerSection extends StatefulWidget {
  const VideoPlayerSection({super.key});

  @override
  State<VideoPlayerSection> createState() => _VideoPlayerSectionState();
}

class _VideoPlayerSectionState extends State<VideoPlayerSection> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Map<String, String>> _videoData = [
    {
      'image': 'assets/images/main/toothbrush.png',
      'title': '3 минуты с пользой',
    },
    {
      'image': 'assets/images/main/toothpaste_in_mouth.png',
      'title': 'Полезное видео #2',
    },
    {
      'image': 'assets/images/main/toothbrush.png',
      'title': 'Интересный ролик',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onPlayTap(int pageIndex) {
    debugPrint('Play button tapped on page $pageIndex');
    // Здесь можно добавить логику воспроизведения видео
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 246,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _videoData.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          final videoInfo = _videoData[index];
          return VideoCard(
            imagePath: videoInfo['image']!,
            title: videoInfo['title']!,
            currentPage: _currentPage,
            totalPages: _videoData.length,
            onPlayTap: () => _onPlayTap(index),
          );
        },
      ),
    );
  }
}