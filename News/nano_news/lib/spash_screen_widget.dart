import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nano_news/home_page_widget.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:nano_news/utility/dependency_assembly.dart';
import 'package:nano_news/utility/shared_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  SharedPreferences sharedPreferences;
  Timer _initializationTimer;

  @override
  void initState() {
    super.initState();
    dependencyAssembler<SharedUtility>().initialize((bool isDone) {
      debugPrint('SharedUtility Inititalized');
    });
    _initializationTimer = Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext _context) => HomePageWidget(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _initializationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: AppTheme.appWhiteColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 1.5,
                        child: Image.asset(
                          'assets/images/app-icon-round.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        'Nano News',
                        style: AppTheme.homeAppBarTitleStyle,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 8,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Image.asset(
                          'assets/images/the-new-york-times-logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
