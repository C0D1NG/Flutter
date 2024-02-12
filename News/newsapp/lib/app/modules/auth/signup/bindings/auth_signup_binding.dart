import 'package:get/get.dart';

import 'package:starter/app/modules/auth/signup/controllers/auth_signup_controller.dart';

class AuthSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthSignupController>(
      () => AuthSignupController(),
    );
  }
}
