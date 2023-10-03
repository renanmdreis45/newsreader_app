import 'package:flutter/material.dart';
import 'package:newsreader_app/models/newsmodel.dart';
import 'package:newsreader_app/utils/utils.dart';
import 'package:newsreader_app/widgets/newsheadline.dart';
import 'package:newsreader_app/bloc/get_news_bloc.dart';
import 'package:newsreader_app/bloc/select_category_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  GetNewsBloc? getNewsBloc;
  SelectCategoryBloc? selectCategoryBloc;

  @override
  void initState() {
    super.initState();
    getNewsBloc = GetNewsBloc();
    getNewsBloc?.getNews('general', 'us');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text(
          'Newsreader App',
          style: textStyle(25, Colors.black, FontWeight.w700),
        ),
        actions: [
          StreamBuilder(
              stream: selectCategoryBloc?.countryStream,
              initialData: selectCategoryBloc?.defaultCountry,
              builder: (context, snapshot) {
                return DropdownButton(
                  dropdownColor: Colors.white,
                  value: snapshot.data,
                  style: textStyle(20, Colors.black, FontWeight.w700),
                  items: countrycodes.map((code) {
                    return DropdownMenuItem(value: code, child: Text(code));
                  }).toList(),
                  iconSize: 22,
                  onChanged: (value) {
                    selectCategoryBloc?.selectCountry(value as String);
                  },
                );
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: selectCategoryBloc?.categoryStream,
                builder: (context, snapshot) {
                  return StreamBuilder(
                      stream: selectCategoryBloc?.countryStream,
                      initialData: selectCategoryBloc?.defaultCategory,
                      builder: (context, countrySnapshot) {
                        return SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categories.map((category) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: InkWell(
                                  onTap: () {
                                    selectCategoryBloc
                                        ?.selectCategory(category);
                                    getNewsBloc?.getNews(
                                        snapshot.data, countrySnapshot.data);
                                  },
                                  child: Text(
                                    category,
                                    style: textStyle(
                                        23,
                                        snapshot.data == category
                                            ? Colors.black
                                            : Colors.grey,
                                        FontWeight.w600),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      });
                }),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<NewsResponse>(
                stream: getNewsBloc!.subject.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<NewsModel>? newsList = snapshot.data?.news;

                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: newsList?.length,
                      itemBuilder: (context, index) {
                        NewsModel news = newsList![index];
                        return NewsHeadline(
                            news.author ?? '',
                            news.title == null ? '' : news.title,
                            news.description == null ? '' : news.title,
                            news.img == null ? '' : news.img,
                            news.date == null ? '' : news.date,
                            news.url == null ? '' : news.url);
                      });
                })
          ],
        ),
      ),
    );
  }
}
