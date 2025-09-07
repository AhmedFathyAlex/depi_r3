import 'package:depi_flutter/news/data/article_model.dart';
import 'package:depi_flutter/news/data/news_repository.dart';
import 'package:depi_flutter/news/ui/cubit/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit():super(InitialNewsState());
  NewsRepository _newsRepository = NewsRepository();

  void fetchData() async {
    emit(LoadingNewsState());
    try{
       List<ArticleModel> articleList = await _newsRepository.getNews(); // data layer
       emit(LoadedNewsState(articleList));
    }catch(e){
      emit(ErrorNewsState());
    } 
  }
}