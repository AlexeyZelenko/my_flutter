# Анимации в приложении

В этом разделе представлены компоненты для добавления современных анимаций в ваше приложение.

## Доступные компоненты

### 1. FadeInAnimation

Компонент для создания эффекта плавного появления элементов с возможностью настройки задержки и смещения.

```dart
FadeInAnimation(
  delay: Duration(milliseconds: 200),
  offset: Offset(0, 20),
  child: YourWidget(),
)
```

### 2. AnimatedButton

Интерактивная кнопка с эффектом нажатия и масштабирования.

```dart
AnimatedButton(
  onPressed: () {
    // Действие при нажатии
  },
  backgroundColor: Colors.blue,
  borderRadius: BorderRadius.circular(12),
  child: Text('Нажми меня'),
)
```

### 3. AnimatedTransitions

Набор анимированных переходов и эффектов:

#### Переход между экранами
```dart
Navigator.of(context).push(
  AnimatedTransitions.fadeTransition(NextScreen())
);
```

#### Анимированный контейнер
```dart
AnimatedTransitions.animatedContainer(
  height: isExpanded ? 200 : 80,
  duration: Duration(milliseconds: 300),
  child: YourWidget(),
)
```

#### Hero анимация
```dart
AnimatedTransitions.heroTransition(
  tag: 'unique_tag',
  child: YourWidget(),
)
```

#### Последовательная анимация списка
```dart
AnimatedTransitions.staggeredList(
  children: yourWidgetList,
)
```

## Примеры использования

Для просмотра примеров использования анимаций, обратитесь к файлу `animation_demo.dart`, который содержит демонстрационный экран с различными типами анимаций.

## Интеграция в проект

1. Для анимации появления элементов при загрузке экрана используйте `FadeInAnimation`
2. Для интерактивных кнопок с эффектом нажатия используйте `AnimatedButton`
3. Для анимированных переходов между экранами используйте `AnimatedTransitions.fadeTransition`
4. Для создания последовательной анимации списка используйте `AnimatedTransitions.staggeredList`

## Настройка глобальных параметров анимаций

Глобальные параметры анимаций настроены в файле `main.dart`:

```dart
themeAnimationDuration: Duration(milliseconds: 300),
themeAnimationCurve: Curves.easeInOut,
```

Вы можете изменить эти параметры для настройки скорости и характера анимаций во всем приложении.