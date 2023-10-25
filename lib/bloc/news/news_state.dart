part of 'news_bloc.dart';

enum NewsStatus { isEmpty, isNotEmpty }

final class NewsState extends Equatable {
  const NewsState._({this.news = NewsModel.empty});

  final NewsModel news;

  const NewsState.unknown() : this._();

  @override
  List<Object> get props => [news];
}
