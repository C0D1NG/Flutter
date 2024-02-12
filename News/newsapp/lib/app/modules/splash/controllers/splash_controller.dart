import 'dart:io';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:starter/app/data/values/env.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/utils/storage/storage_utils.dart';
import 'package:starter/utils/update/update_utils.dart';
import 'package:starter/widgets/dialogs/update_dialog.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startOnboarding();
  }

  _startOnboarding() async {
    if (await UpdateApp.updateAvailable()) {
      _launchUpdate();
    } else {
      _launchPage();
    }
  }

  _launchUpdate() async {
    Get.dialog(
      const UpdateDialog(
        title: Strings.updateApp,
        content: Strings.updateAvailable,
        updateText: Strings.update,
        onTap: _launchStore,
      ),
      barrierDismissible: false,
    );
  }

  _launchPage() async {
    Future.delayed(const Duration(seconds: 3),(){
      if (Storage.isUserExists()) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.NEW_HOME,);
      }
    });
  }
}

_launchStore() async {
  if (Platform.isAndroid) {
    if (!await launch(Env.playStoreLink)) {
      throw 'Could not launch ${Env.playStoreLink}';
    }
  } else if (Platform.isIOS) {
    if (!await launch(Env.appStoreLink)) {
      throw 'Could not launch ${Env.appStoreLink}';
    }
  }
}
