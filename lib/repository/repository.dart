// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsreader_app/models/newsmodel.dart';
import 'package:newsreader_app/utils/utils.dart';

class NewsRepository {
  getNews(String category, String country) async {
    String url =
        "https://newsapi.org/v2/everything?sortBy=popularity&apiKey=8b6390f9c43341ee95bf885149dd5a84";

    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(uri);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("Error fetching news");
      return NewsResponse.showError(e as String);
    }
  }

  getNewsByCategory(int idSelected) async {
    String categoryName = categories[idSelected];

    String url =
        "https://newsapi.org/v2/top-headlines?sortBy=popularity&category=$categoryName&apiKey=8b6390f9c43341ee95bf885149dd5a84";

    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(uri);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("Error fetching news by category");
      return NewsResponse.showError(e as String);
    }
  }

  getNewsByCategoryAndCountry(int idCategory, int idCountry) async {
    String categoryName = categories[idCategory];

    String country = countrycodes[idCountry];

    String url =
        "https://newsapi.org/v2/top-headlines?sortBy=popularity&category=$categoryName&country=$country&apiKey=8b6390f9c43341ee95bf885149dd5a84";

    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(uri);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("Error fetching news by category and country");
      return NewsResponse.showError(e as String);
    }
  }
}
