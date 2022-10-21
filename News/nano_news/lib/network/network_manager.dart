import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nano_news/network/news_exception.dart';

class NetworkManager {
  final Dio dio;
  final String uri;

  NetworkManager({
    this.dio,
    this.uri,
  });

  Future<dynamic> getResponse() async {
    try {
      final response = await dio.get(uri);
      if (response.data != null) {
        final jsonResponse = response.data;
        return jsonResponse;
      }
    } on DioError catch (dioError) {
      debugPrint('Response Error ${dioError}');
      throw NewsException.fromDioError(dioError);
    }
  }
}
