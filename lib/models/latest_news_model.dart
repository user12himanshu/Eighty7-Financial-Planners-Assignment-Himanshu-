import 'dart:convert';

import 'article_model.dart';

LatestNews latestNewsFromMap(String str) =>
    LatestNews.fromMap(json.decode(str));

String latestNewsToMap(LatestNews data) => json.encode(data.toMap());

class LatestNews {
  String status;
  int totalResults;
  List<Article> articles;

  LatestNews({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory LatestNews.fromMap(Map<String, dynamic> json) => LatestNews(
        status: json["status"],
        totalResults: json["totalResults"],
        articles:
            List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
      };
}
