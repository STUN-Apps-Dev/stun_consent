# Stun consent

Экран для получения разрешения пользователя на сбор персональных данных.

| Light                                                                                                         | Dark                                                                                                          |
|---------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| <img height="800" src="https://github.com/STUN-Apps-Dev/stun_consent/blob/master/assets/light.jpeg?raw=true"> | <img  height="800" src="https://github.com/STUN-Apps-Dev/stun_consent/blob/master/assets/dark.jpeg?raw=true"> |

## Локализация
Please refer to the documentation in English at this [link](https://github.com/STUN-Apps-Dev/stun_consent/blob/master/README.md).

## Начало работы

Добавьте следующую строку в секцию `dependencies` вашего `pubspec.yaml`:
```yaml
dependencies:
  stun_consent: <latest-version>
```
После этого выполните команду:
```shell
flutter pub get
```

Импортируйте библиотеку:
```dart
import 'package:stun_consent/stun_consent.dart';
```

Создайте файл `content.json`, поместите его в папку `assets`
Структура файла content.json
```json
{
    "title": "Уважаемый пользователь!", 
    "articles": [
        "Мы используем рекламу для того, чтобы немного заработать, и делать больше полезных приложений для вас.",
        "При запуске приложения будет показываться всего одна реклама, вы сможете пропустить её через 3 секунды. При использовании приложения она не используется, чтобы не мешать вам 🙂",
        "Для корректной работы приложения, персонализации рекламы и сбора статистики мы и наши партнёры собираем некоторые обезличенные данные.",
        "Вы можете отказаться от передачи этих данных с помощью настроек конфиденциальности устройства.",
        "Подробную информацию о том, какие данные собираем мы и наши партнёры, как храним и для чего используем, вы можете найти в политиках конфиденциальности по ссылкам ниже."
    ],
    "app_policy": "https://stun-apps.com",
    "partners_policy": {
        "Политика конфиденциальности <НАЗВАНИЕ ВАШЕЙ КОМПАНИИ>": "https://stun-apps.com",
        "Политики конфиденциальности партнёров <НАЗВАНИЕ ВАШЕЙ КОМПАНИИ>": "https://stun-apps.com"
    }
}
```

## Примеры использования

## ConsentConfig

Это класс отвечающий за внешний вид экрана.

**Свойства ConsentConfig:**

```dart
const kContentPath = 'assets/content.json';
const kAppIconPath = 'assets/ic_launcher.png';

ConsentConfig({
    required this.appName,
    this.backgroundColor = const Color(0xffe3e7e8),
    this.footerColor = Colors.white,
    this.textColor = const Color(0xff0c2e43),
    this.accentColor = const Color(0xff5be769),
    this.buttonTextColor = const Color(0xff0c2e43),
    this.appIconPath = kAppIconPath,
    this.contentPath = kContentPath,
    this.onRequestPermissions,
});

ConsentConfig.dark({
    required this.appName,
    this.backgroundColor = const Color(0xFF212223),
    this.footerColor = const Color(0x19000000),
    this.textColor = Colors.white,
    this.accentColor = const Color(0xFF27AE35),
    this.buttonTextColor = const Color(0xFF232425),
    this.appIconPath = kAppIconPath,
    this.contentPath = kContentPath,
    this.onRequestPermissions,
});
```

## Показ экрана

Для показа экрана используйте метод `StunConsent.showConsent`.

```dart
final config = ConsentConfig(
    appName: 'Stun Consent Demo App',
);

final hasConsent = await StunConsent.showConsent(context, config);
```

В `hasConsent` будет храниться значение дал пользователь согласие или нет.

Экран показывается только 1 раз до очистки кеша или переустановки приложения.

## Другие возможности
```dart
final hasConsent = await StunConsent.hasUserConsent; // проверить дал ли пользователь согласие
final wasShown = await StunConsent.dialogWasShown; // проверить был ли экран показан раньше
```

## Отладка
Для включения режима отладки/логирования используйте метод `enableDebug`. По умолчанию выключен.

В режиме отладки экран будет показываться каждый раз при вызове метода `showConsent`.

```dart
StunConsent.enableDebug(true);
```

## Пример
Полный пример использования доступен в папке [example/](https://github.com/STUN-Apps-Dev/stun_consent)).