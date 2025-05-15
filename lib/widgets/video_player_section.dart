import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class VideoPlayerSection extends StatelessWidget {
  const VideoPlayerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 246,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 44),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      LucideIcons.play,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '3 минуты с пользой',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 16,
            child: Row(
              children: List.generate(
                3,
                (index) => Container(
                  width: index == 1 ? 10 : 4,
                  height: index == 1 ? 10 : 4,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
