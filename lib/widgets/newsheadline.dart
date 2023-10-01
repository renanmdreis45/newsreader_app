import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsreader_app/utils/utils.dart';

class NewsHeadline extends StatelessWidget {
  final String author;
  final String title;
  final String description;
  final String img;
  final String date;
  final String url;

  NewsHeadline(
      this.author, this.title, this.description, this.img, this.date, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
      child: Card(
        elevation: 5,
        child: Row(children: [
          img == '' ? Container() : Image(
            width: MediaQuery.of(context).size.width * 0.33,
            height: 140,
            image: NetworkImage(img)
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title,
                    style: textStyle(16, Colors.black, FontWeight.w600)),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(author,
                        style: textStyle(14, Colors.grey, FontWeight.bold)),
                    Text(DateFormat.yMd().format(DateTime.parse(date)),
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
