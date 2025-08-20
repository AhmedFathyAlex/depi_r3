import 'dart:convert';

import 'package:depi_flutter/news/data/article_model.dart';
import 'package:depi_flutter/news/ui/widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final List<ArticleModel> articles = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: Center(
        child: FutureBuilder(
          future: _fetchData(),
          builder : (context,snapshot){
              if(snapshot.connectionState == ConnectionState.done){

                return Text('${snapshot.data.body}');
              }else if (snapshot.connectionState == ConnectionState.waiting ){
                return CircularProgressIndicator();
              }
              else{
                return  Text('error');
              }
          } 
          //  ListView.builder(
          //   itemCount: articles.length,
          //   itemBuilder: (context, index) {
          //     return ArticleItem(article: articles[index]);
          //   },
          // ),
        ),
      ),
    );
  }

  Future _fetchData() {
    
    var response = http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a6d3520040fc4c378ac9c1ae7807be5c',
      ),
    );
    return response;

    // var rawJson = response.body; // string - json
    // var dataMap = jsonDecode(rawJson) as Map;
    // var listOfArticles = dataMap['articles'] as List;

    // for (var element in listOfArticles) {
    //     var articleModel = ArticleModel(
    //       title: element['title'], 
    //       category: element['author'], 
    //       img: element['urlToImage'],
    //       date: element['publishedAt']
    //     );

    //     setState(() {
    //       articles.add(articleModel);
    //     });
    // }
  }
}
