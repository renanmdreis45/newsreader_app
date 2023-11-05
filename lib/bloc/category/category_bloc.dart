import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsreader_app/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<GetCategories>(_getAllCategories);
    on<SelectCategory>(_selectCategory);
  }

  final allCategories = categories;

  void _getAllCategories(
    GetCategories event, Emitter<CategoryState> emit) async {
      emit(state.copyWith(
        status: CategoryStatus.loading
      ));

      try {
        final genres = categories;
        emit(
          state.copyWith(
            status: CategoryStatus.sucess,
            categories: genres,
          )
        );
      } catch (error) {
        emit(state.copyWith(status: CategoryStatus.error));
      }
  }

  void _selectCategory(SelectCategory event, Emitter<CategoryState> emit) async {
    emit(
      state.copyWith(
        status: CategoryStatus.selected,
        idSelected: event.idSelected,
      )
    );
  }

}
