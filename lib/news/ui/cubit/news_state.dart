import 'package:depi_flutter/news/data/article_model.dart';

abstract class NewsState {}
class InitialNewsState extends NewsState{}
class LoadingNewsState extends NewsState{}

class LoadedNewsState extends NewsState{
  List<ArticleModel> news;
  LoadedNewsState(this.news);
}


class ErrorNewsState extends NewsState{}