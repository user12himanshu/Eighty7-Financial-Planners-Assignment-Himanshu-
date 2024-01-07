import 'dart:math';

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        source: Source.fromMap(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "source": source.toMap(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };

  String getTimeAgoText() {
    DateTime now = DateTime.now();
    Duration diff = now.difference(publishedAt);

    if (diff.inHours <= 24) {
      return "${diff.inHours} hr ago";
    } else {
      if (diff.inDays > 1) {
        return "${diff.inDays} days ago";
      }
      return "${diff.inDays} day ago";
    }
  }

  String getRandomLikesTag() {
    Random random = Random();
    double temp = random.nextDouble();
    return "${((temp + 2) * 3.0).toStringAsFixed(1)} k";
  }
}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
