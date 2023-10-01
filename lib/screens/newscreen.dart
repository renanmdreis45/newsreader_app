import 'package:flutter/material.dart';
import 'package:newsreader_app/models/newsmodel.dart';
import 'package:newsreader_app/utils/utils.dart';
import 'package:newsreader_app/widgets/newsheadline.dart';
import 'package:newsreader_app/bloc/get_news_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  GetNewsBloc? getNewsBloc;

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
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      category,
                      style: textStyle(23, Colors.grey, FontWeight.w600),
                    ),
                  );
                }).toList(),
              ),
            ),
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
                          news.author == null ? '' : news.author, 
                          news.title == null ? '' : news.title,
                          news.description == null ? '' : news.title, 
                          news.img == null ? '' : news.title, 
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
