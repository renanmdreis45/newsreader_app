// import 'dart:async';
// import 'package:newsreader_app/utils/utils.dart';

// class SelectCategoryBloc {
//   final StreamController categoryController = StreamController.broadcast();
//   Stream get categoryStream => categoryController.stream;

//   final StreamController countryController = StreamController.broadcast();
//   Stream get countryStream => countryController.stream;

//   String defaultCategory = categories[0];

//   String defaultCountry = "us";

//   void selectCategory(String category) {
//     categoryController.sink.add(category);
//   }

//   void selectCountry(String code) {
//     countryController.sink.add(code);
//   }

//   dispose() {
//     categoryController?.close();
//     countryController?.close();
//   }
// }

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsreader_app/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState.initial()) {
    on<ChangeCategory>(
        _changeCategory as EventHandler<CategoryEvent, CategoryState>);
  }

  void _changeCategory(ChangeCategory event, Emitter<CategoryState> emit) {
    final newCategory = event.newCategory;

    emit(ChangeCa);
  }
}
