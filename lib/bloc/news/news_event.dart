part of 'news_bloc.dart';


sealed class NewsEvent {
  const NewsEvent();
}

final class ChangeNews extends NewsEvent {
  const ChangeNews(this.news);

  final NewsModel news;
}
