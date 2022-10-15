import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../utlis/secure_storage.dart';
import '../secret.dart';

class Article {
  Article({
    required this.description,
    required this.title,
    required this.url,
    required this.urlToImage,
  });
  final String title, description, url, urlToImage;

  factory Article.fromJson(Map<String, dynamic> data) {
    return Article(
      description: data["description"],
      title: data["title"],
      url: data["url"],
      urlToImage: data["urlToImage"],
    );
  }

  static Future<List<Article>> getNews() async {
    List<Article> news = [];
    const String api =
        'https://newsapi.org/v2/top-headlines?country=id&pageSize=7';
    final url = Uri.parse(api);

    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${await SecureStorage.readKey(tag)}'
      });
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        (jsonData["articles"] as List<dynamic>).forEach((e) {
          news.add(Article.fromJson(e));
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return news;
  }
}
