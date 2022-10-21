import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nano_news/features/feeds/news_details_webview.dart';
import 'package:nano_news/home_page_widget.dart';
import 'package:nano_news/models/news.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class FeedsCardWidget extends StatelessWidget {
  final News news;
  final Function toggleAppBar;
  final Function showDetailsWebView;
  final Function animatePageView;
  FeedsCardWidget(
      {this.news,
      this.toggleAppBar,
      this.showDetailsWebView,
      this.animatePageView});

  String getFormattedDateString({String forDate}) {
    var formatted = '--';
    if (forDate != null) {
      formatted = DateFormat('dd MMMM yyyy').format(DateTime.parse(forDate));
    }
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    final _imageHeaderHeight = _screenHeight / 2.0;

    final _articleDate = getFormattedDateString(forDate: news.postedAt);
    return Container(
      color: AppTheme.feedFooterColor,
      height: _screenHeight,
      width: _screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => toggleAppBar(),
              child: Container(
                margin: EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                  color: AppTheme.appWhiteColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey[800],
                      blurRadius: 18.0,
                      offset: Offset(2.0, 9.0),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        width: _screenWidth,
                        height: _imageHeaderHeight,
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey[700],
                              blurRadius: 18.0,
                              offset: Offset(2.0, 9.0),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                          child: (news.imageURL != null)
                              ? Image.network(
                                  news.imageURL,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            news.title,
                            style: AppTheme.feedTitleTextStyle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            news.content,
                            style: AppTheme.feedDescriptionTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'News ${news.author} / ${_articleDate}.',
                              style: AppTheme.feedDateTextStyle,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                right: 20.0, bottom: 14.0, top: 10.0, left: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  if (news.sourceURL.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsDetailsWebview(),
                          fullscreenDialog: true),
                    );
                  }
                },
                child: (news.sourceName.isNotEmpty)
                    ? RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Tap here to read more at ',
                                style: AppTheme.footerTitleStyle),
                            TextSpan(
                                text: '${news.sourceName}',
                                style: AppTheme.footerTitleSuffixStyle)
                          ],
                        ),
                      )
                    : Text(''),
              ),
            ),
          )
        ],
      ),
    );
  }
}
