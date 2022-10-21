import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_news/home_page_widget.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:nano_news/view_model/news_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsWebview extends ConsumerWidget {
  final Function animatePageView;
  //final News news;
  NewsDetailsWebview({Key key, this.animatePageView}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _news = ref.watch(newsViewModelProvider).getCurrentNews();
    final _url = _news.sourceURL;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text(
            _news.title,
            style: AppTheme.webViewAppBarTitleStyle,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: AppTheme.appWhiteColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: WebView(
        initialUrl: _url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
