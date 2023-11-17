import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsreader_app/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<SelectCategory>(
        _selectCategory as EventHandler<CategoryEvent, CategoryState>);
    on<GetCategories>(
        _getCategories as EventHandler<CategoryEvent, CategoryState>);
  }

  void _getCategories(GetCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: CategoryStatus.loading));

    try {
      final allCategories = categories;

      emit(state.copyWith(
        status: CategoryStatus.sucess,
        categories: allCategories,
      ));
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  void _selectCategory(
      SelectCategory event, Emitter<CategoryState> emit) async {
    emit(
      state.copyWith(
        status: CategoryStatus.selected,
        idSelected: event.idSelected,
      )
    );
  }
}
