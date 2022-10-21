import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0XFFea5455);
  static const Color appWhiteColor = Colors.white;
  static const Color feedBackgroundColor = Color(0XFF5D4232);
  static const Color feedFontColor = Color(0XFF000000);
  static const Color appTitleColor = Color(0XDD000000);
  static const Color appBarTitleColor = Color(0XFFFFFFFF);
  static const Color appTitlePrefixColor = Color(0XFF9E9E9E);
  static const Color appGreyTitleColor = Colors.grey;
  static const Color feedFooterColor = Color(0XFF171831);
  static const Color imageBlendGreyColor = Color(0XFFF2F2F7);

  static const String fontName = 'Georgia';

  static const TextStyle appBarTitleStyle = TextStyle(
    color: appBarTitleColor,
    fontSize: 26.0,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.27,
  );

  static const TextStyle homeAppBarTitleStyle = TextStyle(
    color: appTitleColor,
    fontSize: 26.0,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.27,
  );

  static const TextStyle webViewAppBarTitleStyle = TextStyle(
    color: appBarTitleColor,
    fontSize: 14.0,
    height: 1.2,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.27,
  );

  static const TextStyle footerTitleStyle = TextStyle(
    color: appGreyTitleColor,
    fontSize: 14.0,
    height: 1.2,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.27,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle footerTitleSuffixStyle = TextStyle(
    color: appBarTitleColor,
    fontSize: 15.0,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.27,
  );

  static const TextStyle appBarTitlePrefixStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    letterSpacing: 0.2,
    height: 1.2,
    color: appTitleColor,
  );

  static const TextStyle cardItemTitleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.27,
    height: 1.2,
    color: appTitleColor,
  );

  static const TextStyle feedDateTextStyle = TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 12,
    letterSpacing: 0.2,
    height: 1.2,
    color: appTitlePrefixColor,
  );

  static const TextStyle poweredByTextStyle = TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 15,
    letterSpacing: 0.2,
    height: 1.5,
    color: appGreyTitleColor,
  );

  static const TextStyle loadingTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 17,
    letterSpacing: 0.2,
    height: 1.3,
    color: appTitlePrefixColor,
  );

  static const TextStyle feedDescriptionTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.1,
    height: 1.3,
    color: feedFontColor,
  );

  static const TextStyle feedTitleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.1,
    height: 1.2,
    color: feedFontColor,
  );
}
