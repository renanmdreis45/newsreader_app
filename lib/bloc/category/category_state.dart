part of 'category_bloc.dart';

final class CategoryState extends Equatable {
  const CategoryState._({
    this.defaultCategory = "General",
  });

  final String defaultCategory;

  @override
  List<Object> get props => [defaultCategory];
}
