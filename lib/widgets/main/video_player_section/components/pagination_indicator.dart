import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Компонент для отображения индикатора страниц
class PaginationIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PaginationIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Row(
        children: List.generate(
          totalPages,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: PaginationDot(isActive: currentPage == index),
          ),
        ),
      ),
    );
  }
}

/// Компонент для отображения точки пагинации
class PaginationDot extends StatelessWidget {
  final bool isActive;

  const PaginationDot({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isActive ? 'assets/icons/dot_active.svg' : 'assets/icons/dot_inactive.svg',
    );
  }
}