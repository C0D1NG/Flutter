import 'package:flutter/material.dart';
import 'package:nano_news/home_page_widget.dart';
import 'package:nano_news/utility/app_theme.dart';

class NewsLoadingWidget extends StatefulWidget {
  final Function animatePageView;
  NewsLoadingWidget({this.animatePageView});
  @override
  _NewsLoadingWidgetState createState() => _NewsLoadingWidgetState();
}

class _NewsLoadingWidgetState extends State<NewsLoadingWidget> {
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
                  onPressed: () =>
                      widget.animatePageView(AppPageViewNavigate.back),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  CircularProgressIndicator(
                    backgroundColor: AppTheme.primaryColor,
                  ),
                  SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Please Wait. We are fetching news for you.',
                      style: AppTheme.loadingTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
