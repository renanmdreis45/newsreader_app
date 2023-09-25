import 'package:flutter/material.dart';
import 'package:newsreader_app/utils/utils.dart';

class NewsHeadline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10, right: 5, bottom: 10),
      child: Card(
        elevation: 5,
        child: Row(children: [
          Image(
            width: MediaQuery.of(context).size.width * 0.33,
            height: 140,
            image: NetworkImage(
                "https://www.google.com/imgres?imgurl=https%3A%2F%2Fplay-lh.googleusercontent.com%2FOABfRfKxyvf6PUg_6YBJXvbKSbegFsBKvFDEm5jOA0rC5k1la-OwmnWz6GK55vr3EGA&tbnid=EePz8BH2gqhwTM&vet=12ahUKEwjekb319r6BAxVGNbkGHfiXBsIQMygAegQIARB1..i&imgrefurl=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.home.news.breaking%26hl%3Dpt&docid=goVjQeX4cPp1xM&w=512&h=512&q=news&ved=2ahUKEwjekb319r6BAxVGNbkGHfiXBsIQMygAegQIARB1"),
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Lorem ipsum",
                style: textStyle(16, Colors.black, FontWeight.w600)),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("John Smith",
                    style: textStyle(14, Colors.grey, FontWeight.bold)),
                Text("12-05-21",
                    style: textStyle(14, Colors.grey, FontWeight.bold))
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Icon(
                  Icons.play_arrow_sharp,
                  size: 43,
                  color: Colors.yellow,
                ),
                Icon(Icons.stop, size: 43, color: Colors.black),
                Container(
                    width: 70,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.yellow),
                      child: Text("View",
                          style: textStyle(15, Colors.black, FontWeight.bold)),
                    ))
              ],
            ),
            SizedBox(
              height: 5,
            )
          ])
        ]),
      ),
    );
  }
}
