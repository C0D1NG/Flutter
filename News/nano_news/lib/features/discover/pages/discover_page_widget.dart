import 'package:flutter/material.dart';
import 'package:nano_news/features/discover/cutsom_widgtes/category_list_widget.dart';
import 'package:nano_news/features/discover/cutsom_widgtes/discover_app_bar_widget.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:nano_news/utility/error_banner_widget.dart';

class DiscoverPageWidget extends StatelessWidget {
  DiscoverPageWidget({Key key, this.animatePageView, this.isVisible})
      : super(key: key);
  final Function animatePageView;
  final isVisible;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appWhiteColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          DiscoverAppBarWidget(
            animatePageView: animatePageView,
          ),
          Visibility(
            visible: isVisible,
            child: ErrorBannerWidget(),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: CategoryListWidget(
              animatePageView: animatePageView,
            ),
          ))
        ],
      ),
    );
  }
}
