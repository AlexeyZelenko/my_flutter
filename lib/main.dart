import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/screens/main_screen/main_screen.dart';
import 'package:myapp/theme/app_theme.dart';

/// Точка входа в приложение.
/// 
/// Инициализирует и запускает корневой виджет приложения [MyApp].
void main() {
  runApp(const MyApp());
}

/// Корневой виджет приложения.
/// 
/// Настраивает глобальные параметры приложения, такие как тема и начальный экран.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return MaterialApp(
      title: 'SPLAT App',
      theme: AppTheme.theme,
      home: const MainScreen(),
    );
  }
}