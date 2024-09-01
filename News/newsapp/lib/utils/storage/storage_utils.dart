import 'package:get_storage/get_storage.dart';

import 'package:starter/app/data/models/dto/user.dart';
import 'package:starter/app/data/models/response/app_config_response.dart';

class Storage {
  Storage._privateConstructor();

  static final _box = GetStorage();

  static AppConfig getAppConfig() =>
      AppConfig.fromJson(_box.read(StorageKeys.APP_CONFIG));

  static void setAppConfig(AppConfig appConfig) =>
      _box.write(StorageKeys.APP_CONFIG, appConfig.toJson());

  static User getUser() => User.fromJson(_box.read(StorageKeys.USER));

  static void setUser(User? user) =>
      _box.write(StorageKeys.USER, user?.toJson());

  static bool isUserExists() => _box.read(StorageKeys.USER) != null;

  static bool isAppConfigExists() => _box.read(StorageKeys.APP_CONFIG) != null;
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const APP_CONFIG = 'app_config';
  static const USER = 'user';
}
