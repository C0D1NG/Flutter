import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_news/network/reachability_manager.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:nano_news/utility/error_banner_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoadingNotifier extends StateNotifier<bool> {
  LoadingNotifier(bool state) : super(state);

  void setLoading({bool isloadingValue}) {
    state = isloadingValue;
  }
}

final loadingNotifierProvider =
    StateNotifierProvider<LoadingNotifier, bool>((ref) {
  return LoadingNotifier(true);
});

class SettingsWebviewPage extends ConsumerWidget {
  SettingsWebviewPage({Key key, this.sourceURL, this.title}) : super(key: key);

  final String sourceURL;
  final String title;

  WebViewController _webViewController;

  void reloadWebView() {
    _webViewController?.reload();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _url = sourceURL;
    final _reachabilityManagerProvider = ref.watch(reachabilityManagerProvider);
    final _isBannerVisible =
        (_reachabilityManagerProvider == ReachabilityState.noInternet)
            ? true
            : false;
    final _loadingNotifierProviderState = ref.watch(loadingNotifierProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text(
            title,
            style: AppTheme.webViewAppBarTitleStyle,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: AppTheme.appWhiteColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Visibility(
              visible: _loadingNotifierProviderState,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 45.0,
                  height: 10.0,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
            ),
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  ref
                      .read(
                        loadingNotifierProvider.notifier,
                      )
                      .setLoading(
                        isloadingValue: true,
                      );
                  reloadWebView();
                })
          ],
        ),
      ),
      body: Column(
        children: [
          Visibility(
            visible: _isBannerVisible,
            child: ErrorBannerWidget(),
          ),
          Expanded(
            child: WebView(
              initialUrl: _url,
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (url) {
                ref
                    .read(
                      loadingNotifierProvider.notifier,
                    )
                    .setLoading(
                      isloadingValue: false,
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
