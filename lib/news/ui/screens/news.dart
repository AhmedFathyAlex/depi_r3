import 'package:depi_flutter/news/ui/cubit/news_cubit.dart';
import 'package:depi_flutter/news/ui/cubit/news_state.dart';
import 'package:depi_flutter/news/ui/widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class News extends StatelessWidget {
  News({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: Center(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if(state is LoadedNewsState) {
              return 
            ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context,index){
              return ArticleItem(article: state.news[index],);
            });}

            if(state is ErrorNewsState) return Text('Error');

             return CircularProgressIndicator();
            
          },
        ),
      ),
    );
  }
}
