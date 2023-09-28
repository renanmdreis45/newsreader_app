// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsreader_app/models/newsmodel.dart';

class NewsRepository {
  getNews(String category, String country) async {
    String url =
        "https://newsapi.org/v2/everything?q=Apple&from=2023-09-26&sortBy=popularity&apiKey=8b6390f9c43341ee95bf885149dd5a84";

    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(uri);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("Error fetching news");
      return NewsResponse.showError(e as String);
    }
  }
}
