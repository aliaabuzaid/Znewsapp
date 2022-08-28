import 'article.dart';
class ArticleResponse{
  final List<ArticleModle> articles ;
  final String error;
  ArticleResponse(this.articles,this.error);
  ArticleResponse.fromJson(Map<String,dynamic>  json)
      :articles=(json["articles"] as List).map((e) => ArticleModle.fromJson(e)).toList(),
        error="";
  ArticleResponse.withError(String errorValue)
      :articles =[],//List()
        error =errorValue;}