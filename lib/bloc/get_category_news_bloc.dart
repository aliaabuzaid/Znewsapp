import 'package:flutter/cupertino.dart';
import 'package:znews/model/articleresponse.dart';
import 'package:znews/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
class GetCategoryNewsBloc {
  final NewsRepository repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject = BehaviorSubject<
      ArticleResponse>();

  getCategoryNews(String category) async {
    ArticleResponse articleResponse = await repository.getCategoryNews(category);
    _subject.sink.add(articleResponse);
  }

  void drainStream() {
    _subject.value = null as ArticleResponse;
   // _subject.close();
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;}
  final getCategoryNewsBloc = GetCategoryNewsBloc();
