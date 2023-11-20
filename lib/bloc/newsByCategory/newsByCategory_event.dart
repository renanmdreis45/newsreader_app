part of 'newsByCategory_bloc.dart';

class NewsByCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetNewsByCategory extends NewsByCategoryEvent {
  GetNewsByCategory({
    required this.idCategorySelected,
    required this.idCountrySelected,
    required this.categoryName,
    required this.countryName,
  });

  final int idCategorySelected;
  final int idCountrySelected;
  final String categoryName;
  final String countryName;

  @override
  List<Object?> get props =>
      [idCategorySelected, idCountrySelected, categoryName, countryName];
}
