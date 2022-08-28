import 'package:znews/model/articleresponse.dart';
import 'package:znews/model/source_response.dart';
import 'package:dio/dio.dart';
class NewsRepository {
  static String mainUrl = "https://newsapi.org/v2/";
  final String apikey = "cdac2242d3a8431d84ffedb05222a0aa";
  final Dio dio = Dio();

  var getSourceUrl = '$mainUrl/sources';
  var getTopHeadlinesUrl = '$mainUrl/top-headlines';
  var everythingUrl = '$mainUrl/everything';

  Future<ArticleResponse> getCategory() async {
    var params = {
      "apikey": apikey,
      "language": "ar",
      "country": "ae"
    };
    try {
      Response response = await dio.get(
          getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stackrace) {
      print("Exception occured: $error stackTrace : $stackrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getTopHeadlines() async {
    var params = {
      "apikey": apikey,
      "country": "ae",
    };
    try {
      Response response = await dio.get(
          getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stackrace) {
      print("Exception occured: $error stackTrace : $stackrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> search(String value) async {
    var params = {
      "apikey": apikey,
      "q": value,
      "sortBy": "popularity"};
    try {
      Response response = await dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stackrace) {
      print("Exception occured: $error stackTrace : $stackrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getCategoryNews(String category) async {
    var params = {
      "apikey": apikey,
      "category": category,
      "country": "ae",
    };
    try {
      Response response = await dio.get(
          getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stackrace) {
      print("Exception occured: $error stackTrace : $stackrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getHotNews() async {

    var params = {
      "apikey": apikey,
      "language": "ar",

    };
    try {
      Response response = await dio.get(
         getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stackrace) {
      print("Exception occured: $error stackTrace : $stackrace");
      return ArticleResponse.withError("$error");
    }
  }
}