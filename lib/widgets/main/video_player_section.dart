import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 246,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _videoData.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          final videoInfo = _videoData[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                _buildBackgroundImage(videoInfo['image']!),

                // Overlay with Play Button
                _buildOverlayWithPlayButton(theme, videoInfo['title']!),

                // Pagination Indicator
                _buildPaginationIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBackgroundImage(String imagePath) {
    return Positioned.fill(
      top: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0), // Сохраняем отсутствие скругления
        child: Image.asset(
          imagePath,
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  Widget _buildOverlayWithPlayButton(ThemeData theme, String title) {
    return Positioned.fill(
      top: 60,
      left: 0, right: 0,
      child: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  debugPrint('Play button tapped on page $_currentPage');
                },
                child: Container(
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/play_video.svg',
                      width: 60, // Немного увеличим размер иконки
                      height: 60,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 120, // Увеличим ширину текста
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'ObjectSans',
                    fontSize: 16.0,
                    height: 1.1,
                    letterSpacing: -0.5,
                    color: Colors.black, // Добавим белый цвет текста для лучшей видимости на фоне
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
      bottom: 16, // Увеличим отступ снизу
      right: 16,
      child: Row(
        children: List.generate(
          _videoData.length,
              (index) => Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: _PaginationDot(isActive: _currentPage == index),
          ),
        ),
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
    return SvgPicture.asset(
      isActive ? 'assets/icons/dot_active.svg' : 'assets/icons/dot_inactive.svg',
      // Колір можна задати безпосередньо в SVG-файлах або тут через colorFilter, якщо потрібно динамічно змінювати колір
      // colorFilter: ColorFilter.mode(isActive ? Colors.black : Colors.grey, BlendMode.srcIn),
    );
  }
}