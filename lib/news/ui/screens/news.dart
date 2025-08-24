import 'dart:convert';

import 'package:depi_flutter/news/data/article_model.dart';
import 'package:depi_flutter/news/data/custom_inerceptor.dart';
import 'package:depi_flutter/news/ui/widgets/article_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer_animation/shimmer_animation.dart';

class News extends StatefulWidget {
  News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    dio.interceptors.add(CustomInterceptors()); 
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App')), 
      body: Center(
        child: FutureBuilder(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Response response = snapshot.data;
              final List<ArticleModel> articles = [];
              var listOfArticles = response.data['articles'] as List;

              for (var element in listOfArticles) {
                var articleModel = ArticleModel.fromJson(element);
                articles.add(articleModel);
              }
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ArticleItem(article: articles[index]);
                },
              );
              
            } else if (snapshot.hasError) {
               return Text('error');
            } else {
                 return ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Shimmer(
                    child: Container(
                      color: Colors.grey,
                      width: double.infinity,
                      height: 130,
                      margin: EdgeInsets.all(20),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future _fetchData() async {
    var response = dio.get('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a6d3520040fc4c378ac9c1ae7807be5c');
    return response;

  }
}
