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
  }) : news = news ?? const [],
       categoryName = categoryName ?? '';
    
  final List<NewsModel>? news;
  final NewsByCategoryStatus status;
  final String categoryName;

  @override
  List<dynamic> get props => [status, news, categoryName];

  NewsByCategoryState copyWith({
    List<NewsModel>? news,
    NewsByCategoryStatus? status,
    String? categoryName,
  }) {
    return NewsByCategoryState(
      news: news ?? this.news,
      status: status ?? this.status,
      categoryName:  categoryName ?? this.categoryName
    );
  }
}
