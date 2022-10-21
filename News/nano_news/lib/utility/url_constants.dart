import 'package:flutter_riverpod/flutter_riverpod.dart';

class URLConstants {
  final String _host = 'api.nytimes.com';

  Uri getFeedUrl({String forCategory = 'home', String language = 'en'}) {
    return Uri(
      scheme: 'https',
      host: _host,
      path: '/svc/topstories/v2/$forCategory.json',
      queryParameters: {'api-key': 'new-york-times-api-key'},
    );
  }
}

final urlConstantsProvider = Provider<URLConstants>((ref) {
  return URLConstants();
});
