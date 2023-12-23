import 'package:news_app/data/models/source_model.dart';

class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  SourceModel? source;

  ArticleModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.source});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      source: SourceModel.fromJson(json['source']));
}
