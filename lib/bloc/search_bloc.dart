import 'package:znews/model/articleresponse.dart';
import 'package:znews/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
class SearchBloc{
  final NewsRepository repository =NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =BehaviorSubject<ArticleResponse>();
  search(String value) async{
    ArticleResponse articleResponse=await repository.search(value);
    _subject.sink.add(articleResponse);
  }
  dispose(){
    _subject.close();
  }
  BehaviorSubject<ArticleResponse> get subject => _subject;}
  final searchBloc = SearchBloc();