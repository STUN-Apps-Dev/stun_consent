# Stun Consent

Consent Screen for obtaining user permission to collect personal data.

| Horizontal                                                                                                       | Vertical                                                                                                      |
|------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| <img height="800" src="https://github.com/STUN-Apps-Dev/stun_consent/blob/master/assets/light.png?raw=true"> | <img  height="800" src="https://github.com/STUN-Apps-Dev/stun_consent/blob/master/assets/dark.png?raw=true"> |

## Localization

Please refer to the documentation in English at this [link](https://github.com/STUN-Apps-Dev/stun_consent/blob/master/README.md).

## Getting Started

Add the following line to the `dependencies` section of your `pubspec.yaml`:

```yaml
dependencies:
  stun_consent: <latest-version>
```

Then run the command:

```shell
flutter pub get
```

Import the library:

```dart
import 'package:stun_consent/stun_consent.dart';
```

Create a `content.json` file and place it in the `assets` folder.

Structure of the `content.json` file:

```json
{
    "title": "Dear User!", 
    "articles": [
        "We use ads to earn a little and make more useful applications for you.",
        "At app launch, only one ad will be shown, which you can skip after 3 seconds. It won't be used during app usage so as not to bother you 🙂",
        "For the correct functioning of the app, ad personalization, and statistics collection, we and our partners collect some anonymized data.",
        "You can opt out of sharing this data through your device's privacy settings.",
        "Detailed information about what data we and our partners collect, how we store and use it, can be found in the privacy policies via the links below."
    ],
    "app_policy": "https://stun-apps.com",
    "partners_policy": {
        "Privacy Policy of <YOUR COMPANY NAME>": "https://stun-apps.com",
        "Privacy Policies of partners of <YOUR COMPANY NAME>": "https://stun-apps.com"
    }
}
```

## Usage Examples

### ConsentConfig

This class is responsible for the appearance of the screen.

**Properties of ConsentConfig:**

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

## Displaying the Screen

To display the screen, use the `StunConsent.showConsent` method.

```dart
final config = ConsentConfig(
    appName: 'Stun Consent Demo App',
);

final hasConsent = await StunConsent.showConsent(context, config);
```

The `hasConsent` variable will contain whether the user has given consent or not.

The screen is shown only once until the cache is cleared or the app is reinstalled.

## Other Features

```dart
final hasConsent = await StunConsent.hasUserConsent; // Check if the user has given consent
final wasShown = await StunConsent.dialogWasShown; // Check if the screen was shown before
```

## Debugging

To enable debug/logging mode, use the `enableDebug` method. It is disabled by default.

In debug mode, the screen will be shown every time the `showConsent` method is called.

```dart
StunConsent.enableDebug(true);
```

## Example

A full usage example is available in the [example/](https://github.com/STUN-Apps-Dev/stun_consent) folder.