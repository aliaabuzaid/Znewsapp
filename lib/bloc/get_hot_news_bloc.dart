import 'package:znews/model/articleresponse.dart';
import 'package:znews/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
class GetHotNewsBloc {
  final NewsRepository repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject = BehaviorSubject<ArticleResponse>();

  getHotNews() async {
    ArticleResponse articleResponse = await repository.getHotNews();
    _subject.sink.add(articleResponse);}
    dispose() {
      _subject.close();
    }
      BehaviorSubject<ArticleResponse> get subject => _subject;}
      final getHotNewsBloc = GetHotNewsBloc();


