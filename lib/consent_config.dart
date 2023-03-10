part of 'stun_consent.dart';

class ConsentConfig {
  final Color backgroundColor;
  final Color textColor;
  final Color accentColor;
  final String appIconPath;
  final String appName;
  final String contentPath;

  ConsentConfig({
    this.backgroundColor = const Color(0xffe3e7e8),
    this.textColor = const Color(0xff0c2e43),
    this.accentColor = const Color(0xff5be769),
    required this.appIconPath,
    required this.appName,
    required this.contentPath,
  });
}
