import 'package:flutter/material.dart';
import 'package:newsreader_app/utils/utils.dart';
import 'package:newsreader_app/widgets/newsheadline.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

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
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return NewsHeadline();
                })
          ],
        ),
      ),
    );
  }
}
