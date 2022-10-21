import 'package:flutter/material.dart';
import 'package:nano_news/features/feeds/feeds_page_widget.dart';
import 'package:nano_news/features/side_menu/pages/side_menu_page_widget.dart';
import 'package:nano_news/home_page_widget.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:nano_news/view_model/home_view_model.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class DiscoverAppBarWidget extends StatelessWidget {
  final Function animatePageView;
  DiscoverAppBarWidget({this.animatePageView});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.appWhiteColor,
      padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5, bottom: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SideMenuPageWidget(),
                    ));
                  }),
              Text(
                'Discover',
                style: AppTheme.homeAppBarTitleStyle,
              ),
              InkWell(
                onTap: () => animatePageView(AppPageViewNavigate.forward),
                child: Row(
                  children: [
                    Text(
                      'Feeds',
                      style: AppTheme.appBarTitlePrefixStyle,
                    ),
                    Icon(
                      Icons.arrow_right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
