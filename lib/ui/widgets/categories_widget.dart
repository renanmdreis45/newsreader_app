import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
    required this.categories,
  });

  final List<String> categories;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                selectCategoryBloc?.selectCategory(category);
                getNewsBloc?.getNews(snapshot.data, countrySnapshot.data);
              },
              child: Text(
                category,
                style: textStyle(
                    23,
                    snapshot.data == category ? Colors.black : Colors.grey,
                    FontWeight.w600),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
