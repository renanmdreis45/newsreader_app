import 'dart:async';
import 'package:newsreader_app/utils/utils.dart';

class SelectCategoryBloc {
  final StreamController categoryController = StreamController.broadcast();
  Stream get categoryStream => categoryController.stream;

  final StreamController countryController = StreamController.broadcast();
  Stream get countryStream => countryController.stream;

  String defaultCategory = categories[0];

  String defaultCountry = "us";

  void selectCategory(String category) {
    categoryController.sink.add(category);
  }

  void selectCountry(String code) {
    countryController.sink.add(code);
  }

  dispose() {
    categoryController?.close();
    countryController?.close();
  }
}
