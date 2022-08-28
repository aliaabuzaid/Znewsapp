import 'package:znews/model/articleresponse.dart';
import 'package:znews/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
class GetTopHeadlinesBloc{
  final NewsRepository repository =NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
  BehaviorSubject<ArticleResponse>();
  //getTopHeadlinesBloc
  getTopHeadlines() async{
    ArticleResponse articleResponse=await repository.getTopHeadlines();
    _subject.sink.add(articleResponse);
  }
  dispose(){
    _subject.close();
  }
  BehaviorSubject<ArticleResponse> get subject => _subject;}
  final getTopHeadlinesBloc = GetTopHeadlinesBloc();