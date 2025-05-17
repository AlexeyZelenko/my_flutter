import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/screens/main_screen/main_screen.dart';
import 'package:myapp/theme/app_theme.dart';
import 'package:myapp/widgets/animations/animated_transitions.dart';

/// Точка входа в приложение.
/// 
/// Инициализирует и запускает корневой виджет приложения [MyApp].
void main() {
  // Убедимся, что Flutter инициирован перед запуском приложения
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// Корневой виджет приложения.
///
/// Настраивает глобальные параметры приложения, такие как тема и начальный экран.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Настраиваем прозрачность строки состояния и другие элементы UI
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
      // Добавляем анимированные переходы между экранами по умолчанию
      onGenerateRoute: (settings) {
        // Если маршрут не определен явно, используем анимированный переход
        if (settings.name == null) {
          return null;
        }

        // Получаем страницу для перехода
        Widget? page;
        switch (settings.name) {
          case '/main':
            page = const MainScreen();
            break;
        // Здесь можно добавить другие маршруты
          default:
            return null;
        }

        // Применяем анимированный переход только если страница задана
        if (page != null) {
          return AnimatedTransitions.fadeTransition(page);
        }
        return null;
      },
      // Настраиваем глобальные параметры анимаций
      themeAnimationDuration: const Duration(milliseconds: 300),
      themeAnimationCurve: Curves.easeInOut,
    );
  }
}