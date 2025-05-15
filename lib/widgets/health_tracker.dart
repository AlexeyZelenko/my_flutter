import 'package:flutter/material.dart';

class HealthTracker extends StatelessWidget {
  const HealthTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'ТРЕКЕР ЗДОРОВЬЯ',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _HealthCard(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF98D8FF), Color(0xff98d8ff33)],
                  ),
                  title: 'Как подобрать отбеливающую зубную пасту?',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _HealthCard(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFBFC9E7), Color(0xffbfc9e733)],
                  ),
                  title: 'Как подобрать отбеливающую зубную пасту?',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HealthCard extends StatelessWidget {
  final Gradient gradient;
  final String title;

  const _HealthCard({required this.gradient, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 261,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title, style: Theme.of(context).textTheme.bodyLarge)],
      ),
    );
  }
}
