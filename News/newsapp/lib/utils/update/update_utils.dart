import 'package:package_info_plus/package_info_plus.dart';

import 'package:starter/app/data/models/response/app_config_response.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class UpdateApp {
  static Future<bool> updateAvailable() async {
    AppConfig? appConfig;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String localBuildNumber = packageInfo.buildNumber;
    if (Storage.isAppConfigExists()) {
      appConfig = Storage.getAppConfig();
    }
    String remoteBuildNumber = appConfig?.buildNumber ?? "0";
    return int.parse(localBuildNumber) < int.parse(remoteBuildNumber);
  }
}
