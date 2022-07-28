import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../model/article_model.dart';

class NewsRepository {
  final topHeadlinesUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=${ApiConstants.apiKey}";

  Future<List<Article>> getArticles() async {
    try {
      final response = await http.get(Uri.parse(topHeadlinesUrl));
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> articlesBody = json['articles'];

      List<Article> articles = [];
      articles = articlesBody
          .map((articleMap) => Article.fromJson(articleMap))
          .toList();
      return articles;
    } catch (e) {
      throw "Data could not fetched!";
    }
  }
}
