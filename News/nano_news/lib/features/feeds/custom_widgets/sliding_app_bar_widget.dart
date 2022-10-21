import 'package:flutter/material.dart';
import 'package:nano_news/home_page_widget.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:share/share.dart';

class SlidingAppbar extends StatelessWidget {
  SlidingAppbar(
      {this.controller,
      this.visible,
      this.refreshHandler,
      this.animatePageView});

  final AnimationController controller;
  final bool visible;
  final Function animatePageView;
  final Function refreshHandler;

  @override
  Widget build(BuildContext context) {
    visible ? controller.reverse() : controller.forward();
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: Offset(0, -1),
      ).animate(controller),
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        height: 85.0,
        width: MediaQuery.of(context).size.width,
        color: AppTheme.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppTheme.appWhiteColor,
                ),
                onPressed: () => animatePageView(AppPageViewNavigate.back)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Feed',
                style: AppTheme.appBarTitleStyle,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: AppTheme.appWhiteColor,
              ),
              onPressed: () => refreshHandler(),
            ),
          ],
        ),
      ),
    );
  }
}
