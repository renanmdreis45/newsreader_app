import 'package:flutter/material.dart';
import 'package:newsreader_app/ui/widgets/all_news_widget.dart';
import 'package:newsreader_app/utils/utils.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var selectCountry;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectCountry = "us";
    });
  }

  void changeCountry(dynamic code) {
    setState(() {
      selectCountry = code;
    });
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
          DropdownButton(
            dropdownColor: Colors.white,
            value: selectCountry,
            style: textStyle(20, Colors.black, FontWeight.w700),
            items: countrycodes.map((code) {
              return DropdownMenuItem(value: code, child: Text(code));
            }).toList(),
            iconSize: 22,
            onChanged: (value) {
              print(value);
              changeCountry(value);
            },
          ),
        ],
      ),
      body: AllNewsWidget(
        countryCode: selectCountry,
      ),
    );
  }
}
