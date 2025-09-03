import 'package:depi_flutter/news/data/article_model.dart';
import 'package:depi_flutter/news/ui/cubit/news_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit():super(InitialNewsState());
  Dio dio = Dio();

  void fetchData() async {
    emit(LoadingNewsState());

    print('fetch data...');

    try{
    var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a6d3520040fc4c378ac9c1ae7807be5c',
    );
    var articles = response.data['articles'];
    var articleList = <ArticleModel>[];

    for(var element in articles){
      articleList.add(ArticleModel.fromJson(element));
    }

    emit(LoadedNewsState(articleList));
    }catch(e){
      emit(ErrorNewsState());
    }
    
  }
}