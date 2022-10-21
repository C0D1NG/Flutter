import 'package:flutter/material.dart';
import 'package:nano_news/home_page_widget.dart';
import 'package:nano_news/utility/app_theme.dart';

class NewsErrorWidget extends StatelessWidget {
  final Function refetchNews;
  final String errorMessage;
  final bool showRefresh;
  final Function animatePageView;

  NewsErrorWidget(
      {this.refetchNews,
      this.errorMessage,
      this.showRefresh,
      this.animatePageView});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0),
            height: 95.0,
            width: MediaQuery.of(context).size.width,
            color: AppTheme.primaryColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppTheme.appWhiteColor,
                  ),
                  onPressed: () => animatePageView(AppPageViewNavigate.back),
                ),
                Text(
                  'Feed',
                  style: AppTheme.appBarTitleStyle,
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    errorMessage,
                    style: AppTheme.loadingTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30.0),
                Visibility(
                  visible: showRefresh,
                  child: IconButton(
                    icon: Icon(
                      Icons.refresh,
                      size: 40.0,
                      color: AppTheme.primaryColor,
                    ),
                    onPressed: () => refetchNews(context),
                  ),
                )
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
