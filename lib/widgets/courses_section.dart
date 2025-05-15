import 'package:flutter/material.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('КУРСЫ', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 24),
          SizedBox(
            height: 492,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: _CourseCard(
                    width: 375,
                    height: 400,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFC2F0A7), Color(0xFFFAF9B9)],
                    ),
                    title: 'Твоя палитра',
                  ),
                ),
                Positioned(
                  top: 56,
                  child: _CourseCard(
                    width: 363,
                    height: 400,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFC9D2EF), Color(0xFFE7F4FF)],
                    ),
                    title: 'Красота по прикусу',
                  ),
                ),
                Positioned(
                  top: 112,
                  child: _CourseCard(
                    width: 351,
                    height: 380,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF98CBFF), Color(0xFFE2F1FC)],
                    ),
                    title: 'Улыбка с пелёнок: как ухаживать за детскими зубами',
                    lessons: '5 уроков',
                    showProgress: true,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 351,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(43),
                ),
              ),
              child: const Text(
                'ИЗУЧАТЬ',
                style: TextStyle(
                  fontFamily: 'Grtsk Giga',
                  fontSize: 12,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final double width;
  final double height;
  final Gradient gradient;
  final String title;
  final String? lessons;
  final bool showProgress;

  const _CourseCard({
    required this.width,
    required this.height,
    required this.gradient,
    required this.title,
    this.lessons,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(48),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                if (lessons != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    lessons!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black.withOpacity(0.6),
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (showProgress)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    '1/3',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
