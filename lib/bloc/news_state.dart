import 'package:equatable/equatable.dart';
import 'package:news_app_with_interns_tutorial/model/article_model.dart';

import '../repository/news_repository.dart';

class NewsState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<Article> articles;
  NewsSuccess(this.articles);
}

class NewsFailure extends NewsState {}
