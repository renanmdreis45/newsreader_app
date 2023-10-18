import 'package:bloc/bloc.dart';
import 'package:newsreader_app/models/newsmodel.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:newsreader_app/repository/repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:newsreader_app/models/newsmodel.dart';
import 'package:equatable/equatable.dart';
part 'news_state.dart';

const throttleDuration = Duration(milliseconds: 100);

  EventTransformer<E> throttleDroppable<E>(Duration duration) {
    return (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };
  }

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository = NewsRepository();

  NewsBloc() : super(const NewsState()) {
    on<NewsFetched>(
      _onNewsFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onNewsFetched(
    NewsFetched event,
    Emitter<NewsState> emit,
  ) async {
    try {
      if(state.status == NewsStatus.initial) {
        final news = await _fetchNews(state.category, state.country);
      }
    }
  }

  Future<List<NewsModel>> _fetchNews(String category, String country) async {
    final news = await newsRepository.getNews(category, country);
    return news;
  }
}
