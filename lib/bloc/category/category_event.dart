part of 'category_bloc.dart';

sealed class CategoryEvent {
  const CategoryEvent();
}

final class ChangeCategory extends CategoryEvent {
  const ChangeCategory(this.newCategory);

  final String newCategory;
}
