import 'package:newsreader_app/models/newsmodel.dart';
import 'package:newsreader_app/repository/newsrepository.dart';
import 'package:rxdart/rxdart.dart';

class GetNewsBloc {
  final NewsRepository newsRepository = NewsRepository();
  final BehaviorSubject<NewsResponse> _subject =
      BehaviorSubject<NewsResponse>();
  BehaviorSubject<NewsResponse> get subject => _subject;

  getNews(String category, String country) async {
    NewsResponse newsResponse = await newsRepository.getNews(category, country);
    _subject.sink.add(newsResponse);
  }

  dispose() {
    _subject.close();
  }
}
