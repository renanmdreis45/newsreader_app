import 'package:flutter/material.dart';
import 'package:newsreader_app/models/newsmodel.dart';
import 'package:newsreader_app/ui/widgets/categories_widget.dart';
import 'package:newsreader_app/ui/widgets/newsheadline.dart';
import 'package:newsreader_app/utils/utils.dart';

class AllNewsSuccessWidget extends StatelessWidget {
  const AllNewsSuccessWidget({
    Key? key,
    required this.news,
  }) : super(key: key);

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CategoriesWidget(categories: categories),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: ((100 * news.length) + MediaQuery.of(context).size.width) + 24.0,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: news.length,
              itemBuilder: (context, index) {
                NewsModel newsCurrent = news[index];
                return NewsHeadline(
                    newsCurrent.author ?? '',
                    newsCurrent.title ?? '',
                    newsCurrent.description ?? '',
                    newsCurrent.img ?? '',
                    newsCurrent.date ?? '',
                    newsCurrent.url ?? '');
              },
              separatorBuilder: (_, __) => const SizedBox(
                height: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
