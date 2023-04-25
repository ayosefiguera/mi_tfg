import 'dart:convert';

class LegalPage {
  LegalPage({required this.title, required this.content});

  String title;
  String content;

  factory LegalPage.fromJson(String str) =>
      LegalPage.fromMap(json.decode(str));

  factory LegalPage.fromMap(Map<String, dynamic> json) => LegalPage(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "content": content,
      };

  @override
  String toString() => title;
}
