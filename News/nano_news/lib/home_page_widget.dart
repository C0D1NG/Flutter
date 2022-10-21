import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_news/features/feeds/feeds_page_widget.dart';
import 'package:nano_news/features/feeds/news_details_webview.dart';
import 'package:nano_news/network/reachability_manager.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:nano_news/utility/dependency_assembly.dart';
import 'package:nano_news/utility/error_banner_widget.dart';
import 'package:nano_news/utility/shared_utility.dart';
import 'package:nano_news/view_model/catergory_view_model.dart';
import 'package:nano_news/view_model/home_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/discover/pages/discover_page_widget.dart';

enum AppPageViewNavigate { back, forward }

class HomePageWidget extends ConsumerWidget {
  PageController _pageController = PageController();

  void _animatePageView(AppPageViewNavigate page) {
    if (page == AppPageViewNavigate.forward) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _reachabilityManagerProvider = ref.watch(reachabilityManagerProvider);
    final _isVisible =
        (_reachabilityManagerProvider == ReachabilityState.noInternet)
            ? true
            : false;

    return PageView(
      controller: _pageController,
      onPageChanged: (value) {
        //
      },
      children: [
        DiscoverPageWidget(
          key: UniqueKey(),
          animatePageView: _animatePageView,
          isVisible: _isVisible,
        ),
        AllNews(
          key: UniqueKey(),
          animatePageView: _animatePageView,
        ),
      ],
    );
  }
}
