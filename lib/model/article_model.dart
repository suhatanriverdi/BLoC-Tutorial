class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> articleMap) {
    return Article(
      author: articleMap['author'] ?? "",
      title: articleMap['title'] ?? "",
      description: articleMap['description'] ?? "",
      url: articleMap['url'] ?? "",
      urlToImage: articleMap['urlToImage'] ?? "",
      publishedAt: articleMap['publishedAt'] ?? "",
      content: articleMap['content'] ?? "",
    );
  }
}
