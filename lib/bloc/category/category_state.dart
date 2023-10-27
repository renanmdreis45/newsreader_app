part of 'category_bloc.dart';

enum CategoryStatus { initial, sucess, error, loading, selected }

extension CategoryStatusX on CategoryStatus {
  bool get isInitial => this == CategoryStatus.initial;
  bool get isSucess => this == CategoryStatus.sucess;
  bool get isError => this == CategoryStatus.error;
  bool get isLoading => this == CategoryStatus.loading;
  bool get isSelected => this == CategoryStatus.selected;
}

final class CategoryState extends Equatable {
  const CategoryState._({
    int idSelected = 0,
    List<String>? categories,
  })  : categories = categories ?? const [],
        idSelected = idSelected;

  final int idSelected;
  final List<String> categories;

  const CategoryState.initial() : this._();

  @override
  List<Object> get props => [category];
}
