# STUN Consent

Экран для полученя согласия разрешения пользователя

# Установка

1. Добавьте зависимость из гит-репозитория в `pubspec.yaml`.
    ```yaml
    stun_consent:
      git:
        url: ssh://git@git.jetbrains.space/stun/stun-packages/stun-consent.git
    ```
2. Добавьте в проект новый файл типа `json` и подключите его как `asset` в `pubspec.yaml`.
3. Заполните файл контентом, который нужно отображать на экране согласия пользователя. Ниже представлен пример файла.
    ```json
    {
        "title": "Это заголовок", 
        "articles": [
            "Это параграф с описанием",
            "Это ещё один параграф с описанием"
        ],
        "app_policy": "Это ссылка на политику конфидециальности приложения",
        "partners_policy": {
            "Это ссылка на политику конфидециальности партнёров",
            "Это ещё одна ссылка на политику конфидециальности партнёров"
        }
    }
    ```
    
Теперь плагин готов к использованию.

# Использование
Доступ ко всем методам осуществляется через класс `StunConsent`.

Для показа экрана используйте метод `showConsent`. Он принимает на вход `BuildContext` и `ConsentConfig`.

### ConsentConfig
Это класс, для стилизации экрана. Ниже описаны параметры класса.
* `Color backgroundColor` - цвет, на котором расположен весь остальной контент.
* `Color textColor` - цвет текста.
* `Color accentColor` - акцентирующий цвет (цвет кнопки).
* `String appIconPath` - путь к иконке приложения (из ассетов).
* `String appName` - название приложения.
* `String contentPath` - путь к файлу с контентом (из ассетов).

Ниже представлен полный пример вызова экрана.

```dart
final config = ConsentConfig(
    appIconPath: 'assets/ic_launcher.png',
    appName: 'Stun Consent Demo App',
    contentPath: 'assets/content.json',
);

final hasConsent = await StunConsent.showConsent(context, config);
```

`showConsent` возвращает переменную типа `bool`. 

Она будет истина, если пользователь дал согласие. В остальных случаях ложна.

Экран показывается только 1 раз, больше он показан не будет до очистки кеша или переустановки приложения.

## Вспомогательные методы
```dart
final hasConsent = await StunConsent.hasUserConsent; // проверить дал ли пользователь согласие
final wasShown = await StunConsent.dialogWasShown; // проверить был ли экран показан раньше
```

## Отладка
Для включения режима отладки/логирования используйте метод `enableDebug`. По умолчанию он установлен в `false`.

```dart
StunConsent.enableDebug(true);
```

В режиме отладки экран будет показываться каждый раз при вызове метода `showConsent`.