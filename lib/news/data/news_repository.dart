import 'package:depi_flutter/news/data/article_model.dart';
import 'package:dio/dio.dart';

class NewsRepository {
  Dio dio = Dio();


  Future<List<ArticleModel>> getNews()async{
     var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a6d3520040fc4c378ac9c1ae7807be5c',
    );
    var articles = response.data['articles'];
    var articleList = <ArticleModel>[];

    for(var element in articles){
      articleList.add(ArticleModel.fromJson(element));
    }
    return articleList;
  }

}