import 'package:flutter/material.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'name':
            'Ополаскиватель пенный для полости рта SPLAT® с ароматом дикой малины, 50 мл',
        'price': '300 ₽',
      },
      {
        'name': 'Зубная паста INNOVA® ИНТЕНСИВНОЕ ВОССТАНОВЛЕНИЕ ЭМАЛИ, 75 мл',
        'price': '200 ₽',
        'originalPrice': '320 ₽',
      },
      {
        'name':
            'Ополаскиватель пенный для полости рта SPLAT® с ароматом дикой малины, 50 мл',
        'price': '300 ₽',
      },
      {
        'name':
            'Ополаскиватель пенный для полости рта SPLAT® с ароматом дикой малины, 50 мл',
        'price': '300 ₽',
      },
    ];

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'РЕКОМЕНДУЕМ ВАМ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 48),
          Stack(
            children: [
              Positioned(
                top: 48,
                left: -66,
                child: Container(
                  width: 500,
                  height: 538,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD6EFFA),
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: const SizedBox(),
                ),
              ),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children:
                    products.map((product) {
                      return Container(
                        width: 178,
                        height: 290,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(child: SizedBox()),
                              Text(
                                product['name']!,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: const Color(0xFF7B878E)),
                              ),
                              const SizedBox(height: 16),
                              if (product['originalPrice'] != null)
                                Text(
                                  product['originalPrice']!,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12,
                                  ),
                                ),
                              Text(
                                product['price']!,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(43),
                ),
              ),
              child: const Text(
                'К ПОКУПКАМ',
                style: TextStyle(
                  fontFamily: 'Grtsk Giga',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
