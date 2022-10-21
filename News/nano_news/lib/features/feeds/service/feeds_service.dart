import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_news/models/news.dart';
import 'package:nano_news/network/network_manager.dart';
import 'package:nano_news/utility/url_constants.dart';

final feedServiceProvider =
    Provider.family<FeedsService, String>((ref, _categoryname) {
  final feedUrl = ref
      .watch(urlConstantsProvider)
      .getFeedUrl(forCategory: _categoryname)
      .toString();

  return FeedsService(
    networkManager: NetworkManager(
      dio: Dio(),
      uri: feedUrl,
    ),
  );
});

class FeedsService {
  final NetworkManager networkManager;

  FeedsService({
    this.networkManager,
  });

  Future<List<News>> fetchNews() async {
    try {
      final _jsonResponse = await networkManager.getResponse();
      final _results = Map<String, dynamic>.from(_jsonResponse);
      final _resultsList = List<Map<String, dynamic>>.from(_results['results']);
      final _newsArray = _resultsList
          .map((mapValue) => News.fromMap(mapValue))
          .toList(growable: false);
      return _newsArray;
    } catch (_) {
      rethrow;
    }
  }
}
