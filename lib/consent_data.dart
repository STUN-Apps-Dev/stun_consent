part of 'stun_consent.dart';

class ConsentData {
  final String title;
  final List<String> articles;
  final String appPolicy;
  final Map<String, String> partnersPolicy;

  ConsentData({
    required this.title,
    required this.articles,
    required this.appPolicy,
    required this.partnersPolicy,
  });

  factory ConsentData.fromMap(Map<String, dynamic> map) {
    return ConsentData(
      title: map['title'] ?? '',
      articles: List<String>.from(map['articles']),
      appPolicy: map['app_policy'] ?? '',
      partnersPolicy: Map<String, String>.from(map['partners_policy']),
    );
  }

  factory ConsentData.fromJson(String source) =>
      ConsentData.fromMap(json.decode(source));
}
