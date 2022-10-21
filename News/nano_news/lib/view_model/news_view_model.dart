import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_news/models/news.dart';

final newsViewModelProvider = Provider<NewsViewModel>((ref) {
  return NewsViewModel();
});

class NewsViewModel {
  News _currentNews;

  void setCurrentNews({News news}) {
    _currentNews = news;
  }

  News getCurrentNews() {
    return _currentNews;
  }
}
