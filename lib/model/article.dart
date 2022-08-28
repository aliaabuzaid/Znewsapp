import 'dart:convert';
import 'package:znews/model/source.dart';
class ArticleModle{
  final SourceModle source;
  final String auther ;
  final String title;
  final String description;
  final String url;
  final String img;
  final String data;     //date
  final String content;
  ArticleModle(this.source,this.auther,this.title,this.content,this.data,this.description,
      this.img,this.url);
  ArticleModle.fromJson(Map<String,dynamic>  json)
      :source=SourceModle.fromJson(json["source"]),
        auther =json["author"]??"",
        title =json["title"]??"",
        description=json["description"]??"",
        url=json["url"]??"",
        data=json["publishedAt"]??"",
        img=json["urlToImage"]??"",
        content=json["content"]??"";}