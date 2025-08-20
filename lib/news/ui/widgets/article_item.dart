import 'package:depi_flutter/news/data/article_model.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, this.article});
  final ArticleModel? article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 130,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  article?.img ??
                      'https://yt3.googleusercontent.com/v4JamQ9B-PUiJHjmZQs9UwTaoLQW8vijJMMpV5QvA2wHQ6iwWM8Q1s6O4jgTl0dtDigVWAi7SA=s900-c-k-c0x00ffffff-no-rj',
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  maxLines: 1,
                  article?.category ?? 'no category',
                  style: TextStyle(color: Colors.grey.shade400),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 150,
                child: Text(
                  article?.title ??
                      'This is the news  title This is the news title',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                article?.date ?? '00-0-0000',
                style: TextStyle(color: Colors.grey.shade400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
