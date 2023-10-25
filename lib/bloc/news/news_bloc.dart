import 'package:bloc/bloc.dart';
import 'package:newsreader_app/models/newsmodel.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:newsreader_app/repository/repository.dart';
import 'package:newsreader_app/models/newsmodel.dart';
import 'package:equatable/equatable.dart';

part 'news_state.dart';
part 'news_event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(const NewsState.unknown()) {
    on<ChangeNews>(_fetchNews as EventHandler<ChangeNews, NewsState>);
  }

  final NewsRepository _newsRepository;
  late final StreamSubscription<NewsModel> _newsSubscription;

  Future<NewsResponse> _fetchNews(String category, String country) async {
    final NewsResponse news = await _newsRepository.getNews(category, country);
    return news;
  }

  @override
  Future<void> close() {
    _newsSubscription.cancel();
    return super.close();
  }
}
