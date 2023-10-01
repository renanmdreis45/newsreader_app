import 'dart:async';

class SelectCategoryBloc {
  final StreamController categoryController = StreamController.broadcast();
  Stream get categoryStream => categoryController.stream;

  String defaultCategory = categories[0];

  void selectCategory(String category) {
    categoryController.sink.add(category);
  }

  dispose() {
    categoryController?.close();
  }
}
