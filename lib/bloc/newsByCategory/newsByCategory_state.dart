part of 'newsByCategory_bloc.dart';

enum NewsByCategoryStatus { initial, sucess, error, loading }

extension NewsByCategoryStatusX on NewsByCategoryStatus {
  bool get isInitial => this == NewsByCategoryStatus.initial;
  bool get isSucess => this == NewsByCategoryStatus.sucess;
  bool get isError => this == NewsByCategoryStatus.error;
  bool get isLoading => this == NewsByCategoryStatus.loading;
}

class NewsByCategoryState extends Equatable {
  const NewsByCategoryState({
    this.status = NewsByCategoryStatus.initial,
    List<NewsModel>? news,
    String? categoryName,
    String? countryName,
  })  : news = news ?? const [],
        categoryName = categoryName ?? '',
        countryName = countryName ?? '';

  final List<NewsModel>? news;
  final NewsByCategoryStatus status;
  final String categoryName;
  final String countryName;

  @override
  List<dynamic> get props => [status, news, categoryName];

  NewsByCategoryState copyWith({
    List<NewsModel>? news,
    NewsByCategoryStatus? status,
    String? categoryName,
    String? countryName,
  }) {
    return NewsByCategoryState(
        news: news ?? this.news,
        status: status ?? this.status,
        categoryName: categoryName ?? this.categoryName,
        countryName: countryName ?? this.countryName);
  }
}
