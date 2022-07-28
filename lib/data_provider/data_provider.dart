import '../model/article_model.dart';
import '../repository/news_repository.dart';

class DataProvider {
  final NewsRepository _repository = NewsRepository();

  Future<List<Article>> getArticles() async {
    return await _repository.getArticles();
  }
}
