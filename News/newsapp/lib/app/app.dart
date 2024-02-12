import 'package:flutter/material.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';

import 'package:starter/app/app_binding.dart';
import 'package:starter/app/data/values/constants.dart';
import 'package:starter/app/data/values/env.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_theme.dart';
import 'package:starter/widgets/custom_error/custom_error.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: errorBuilder,
      title: Env.title,
      navigatorKey: GlobalKeys.navigationKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
    );
  }

  Widget errorBuilder(BuildContext context, Widget? widget) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      FirebaseCrashlytics.instance.recordError(
        errorDetails.exception,
        errorDetails.stack,
        reason: ErrorMessages.networkGeneral,
      );
      return CustomError(errorDetails: errorDetails);
    };
    return widget ?? Container();
  }
}
