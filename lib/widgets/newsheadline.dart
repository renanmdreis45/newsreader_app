import 'package:flutter/material.dart';
import 'package:newsreader_app/utils/utils.dart';

class NewsHeadline extends StatelessWidget {
  const NewsHeadline({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
      child: Card(
        elevation: 5,
        child: Row(children: [
          Image(
            width: MediaQuery.of(context).size.width * 0.33,
            height: 140,
            image: const NetworkImage(
                "https://previews.123rf.com/images/alhovik/alhovik1709/alhovik170900031/86481591-breaking-news-background-world-global-tv-news-banner-design.jpg"),
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("Software is a companys third-largest expense, but because its spread across multiple departments, its the CFOs responsibility to find places to cut.",
                      style: textStyle(16, Colors.black, FontWeight.w600)),
                  const SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("John Smith",
                            style: textStyle(14, Colors.grey, FontWeight.bold)),
                        Text("12-05-21",
                            style: textStyle(14, Colors.grey, FontWeight.bold))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.play_arrow_sharp,
                              size: 43,
                              color: Colors.yellow,
                            ),
                            Icon(Icons.stop, size: 43, color: Colors.black),
                          ],
                        ),
                        Container(
                            width: 70,
                            height: 32,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.yellow),
                              child: Text("View",
                                  style:
                                      textStyle(15, Colors.black, FontWeight.bold)),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ]),
              ))
        ]),
      ),
    );
  }
}
