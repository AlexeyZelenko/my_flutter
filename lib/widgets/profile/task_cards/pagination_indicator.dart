import 'package:flutter/material.dart';

/// Виджет индикатора страниц для карусели задач
class PaginationIndicator extends StatelessWidget {
  final int itemCount;
  final int currentPage;
  
  const PaginationIndicator({
    super.key,
    required this.itemCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentPage == index ? 24 : 8,
          decoration: BoxDecoration(
            color: currentPage == index 
                ? const Color(0xFFDF2B50) 
                : const Color(0xFFDF2B50).withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}