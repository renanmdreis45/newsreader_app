import 'package:equatable/equatable.dart';

part 'newsByCategory_bloc.dart';

class NewsByCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetNewsByCategory extends NewsByCategoryEvent {
  GetNewsByCategory({
    required this.idSelected,
    required this.categoryName,
  });

  final int idSelected;
  final String categoryName;

  @override
  List<Object?> get props => [idSelected, categoryName];
}
