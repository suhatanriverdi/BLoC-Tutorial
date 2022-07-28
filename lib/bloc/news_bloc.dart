import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_interns_tutorial/data_provider/data_provider.dart';
import '../model/article_model.dart';
import 'bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetTopHeadlinesEvent) {
        emit(NewsLoading());
        try {
          DataProvider dataProvider = DataProvider();
          List<Article> articles = await dataProvider.getArticles();
          emit(NewsSuccess(articles));
        } catch (e) {
          emit(NewsFailure());
          throw "BLoC Error!";
        }
      }
    });
  }
}
