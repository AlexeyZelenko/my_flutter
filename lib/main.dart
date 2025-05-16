import 'package:flutter/material.dart';
import 'package:myapp/screens/main_screen/main_screen.dart';
import 'package:myapp/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPLAT App',
      theme: AppTheme.theme,
      home: const MainScreen(),
    );
  }
}
