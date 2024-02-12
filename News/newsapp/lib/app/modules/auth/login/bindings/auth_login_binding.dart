import 'package:get/get.dart';

import 'package:starter/app/modules/auth/login/controllers/auth_login_controller.dart';

class AuthLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthLoginController>(
      () => AuthLoginController(),
    );
  }
}
