import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_news/features/feeds/custom_widgets/feeds_card_widget.dart';
import 'package:nano_news/features/feeds/custom_widgets/news_error_widget.dart';
import 'package:nano_news/features/feeds/custom_widgets/news_loading_widget.dart';
import 'package:nano_news/features/feeds/custom_widgets/sliding_app_bar_widget.dart';
import 'package:nano_news/features/feeds/service/feeds_service.dart';
import 'package:nano_news/models/news.dart';
import 'package:nano_news/network/news_exception.dart';
import 'package:nano_news/view_model/catergory_view_model.dart';
import 'package:nano_news/view_model/news_view_model.dart';

final newsFetchFutureProvider =
    FutureProvider.autoDispose<List<News>>((ref) async {
  final _selectedCategory =
      ref.watch(categoryViewModelProvider).getCurrentCatgory();
  final _newsService = ref.watch(feedServiceProvider(_selectedCategory.id));
  final _newsList = _newsService.fetchNews();
  return _newsList;
});

class AllNews extends ConsumerWidget {
  final Function animatePageView;
  AllNews({Key key, this.animatePageView}) : super(key: key);

  void _refreshData(BuildContext context, WidgetRef ref) {
    ref.refresh(newsFetchFutureProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(newsFetchFutureProvider).when(
          data: (news) {
            if (news.isEmpty) {
              return NewsErrorWidget(
                showRefresh: false,
                refetchNews: _refreshData,
                errorMessage:
                    'Sorry. We donot have any news for this category. Please select some other category.',
                animatePageView: animatePageView,
              );
            }
            return FeedsPageWidget(
              newsArray: news,
              refreshNews: _refreshData,
              animatePageView: animatePageView,
            );
          },
          loading: () => NewsLoadingWidget(
                animatePageView: animatePageView,
              ),
          error: (e, s) {
            if (e is NewsException) {
              return NewsErrorWidget(
                showRefresh: true,
                refetchNews: _refreshData,
                errorMessage: e.message,
                animatePageView: animatePageView,
              );
            }
            return NewsErrorWidget(
              showRefresh: true,
              refetchNews: _refreshData,
              errorMessage:
                  'Sorry. We failed fetching news for you. Please retry in sometime.',
              animatePageView: animatePageView,
            );
          }),
    );
  }
}

class FeedsPageWidget extends ConsumerStatefulWidget {
  final Function animatePageView;
  final List<News> newsArray;
  final Function refreshNews;

  FeedsPageWidget({this.newsArray, this.refreshNews, this.animatePageView});

  @override
  ConsumerState<FeedsPageWidget> createState() => _FeedsPageWidgetState();
}

class _FeedsPageWidgetState extends ConsumerState<FeedsPageWidget>
    with SingleTickerProviderStateMixin {
  var _showAppBar = true;
  AnimationController _controller;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    final _newsArray = widget.newsArray;
    if (_newsArray.isNotEmpty) {
      final _news = _newsArray[0];
      ref.read(newsViewModelProvider).setCurrentNews(news: _news);
    }

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Function _toggleAppBar() {
    setState(() {
      _showAppBar = !_showAppBar;
    });
  }

  void _showDetailsWebview() {
    _pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _newsArray = widget.newsArray;

    return Stack(
      children: [
        PageView.builder(
            controller: _pageController,
            itemCount: _newsArray.length,
            scrollDirection: Axis.vertical,
            onPageChanged: (value) {
              final _news = _newsArray[value];
              ref.read(newsViewModelProvider).setCurrentNews(news: _news);
            },
            itemBuilder: (BuildContext context, int itemIndex) {
              final _news = _newsArray[itemIndex];
              return FeedsCardWidget(
                news: _news,
                toggleAppBar: _toggleAppBar,
                showDetailsWebView: _showDetailsWebview,
                animatePageView: widget.animatePageView,
              );
            }),
        Consumer(
          builder: (context, watch, child) {
            // Listens to the value exposed by counterProvider
            return SlidingAppbar(
              controller: _controller,
              visible: _showAppBar,
              animatePageView: widget.animatePageView,
              refreshHandler: () {
                //use hook widget
                ref.refresh(newsFetchFutureProvider);
              },
            );
          },
        )
      ],
    );
  }
}
