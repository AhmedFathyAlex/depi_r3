class ArticleModel {
   String? img;
   String? title;
   String? category;
   String? date;

  ArticleModel({this.title,
   this.img,
    this.date,
     this.category});

  ArticleModel.fromJson(Map json){
    title = json['title'];
      category = json['author'];
      img = json['urlToImage'];
      date = json['publishedAt'];
  } 


  
}
