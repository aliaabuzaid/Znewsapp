import 'package:znews/model/articleresponse.dart';
import 'package:znews/model/source_response.dart';
import 'package:znews/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
class GetCategoryBloc {
  /*final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
  BehaviorSubject<ArticleResponse>();
  getSources() async {
    ArticleResponse response = await _repository.getCategory();
    _subject.sink.add(response);
  }
  dispose() {
    _subject.close();
  }
  BehaviorSubject<ArticleResponse> get subject => _subject;*/}
  final getCategoryBloc = GetCategoryBloc();