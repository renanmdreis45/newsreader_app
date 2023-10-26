part of 'category_bloc.dart';

final class CategoryState extends Equatable {
  const CategoryState._({
    this.category = "General",
  });

  final String category;

  const CategoryState.initial() : this._();

  @override
  List<Object> get props => [category];
}
