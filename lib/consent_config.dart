part of 'stun_consent.dart';

class ConsentConfig {
  final Color backgroundColor;
  final Color footerColor;
  final Color textColor;
  final Color accentColor;
  final Color buttonTextColor;
  final String appIconPath;
  final String appName;
  final String contentPath;
  final Future<void> Function()? onRequestPermissions;

  ConsentConfig({
    this.backgroundColor = const Color(0xffe3e7e8),
    this.footerColor = Colors.white,
    this.textColor = const Color(0xff0c2e43),
    this.accentColor = const Color(0xff5be769),
    this.buttonTextColor = const Color(0xff0c2e43),
    required this.appIconPath,
    required this.appName,
    required this.contentPath,
    this.onRequestPermissions,
  });

  ConsentConfig.dark({
    this.backgroundColor = const Color(0xFF212223),
    this.footerColor = const Color(0x19000000),
    this.textColor = Colors.white,
    this.accentColor = const Color(0xFF27AE35),
    this.buttonTextColor = const Color(0xFF232425),
    required this.appIconPath,
    required this.appName,
    required this.contentPath,
    this.onRequestPermissions,
  });
}
