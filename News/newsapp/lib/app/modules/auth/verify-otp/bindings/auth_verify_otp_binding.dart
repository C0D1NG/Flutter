import 'package:get/get.dart';

import 'package:starter/app/modules/auth/verify-otp/controllers/auth_verify_otp_controller.dart';

class AuthVerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthVerifyOtpController>(
      () => AuthVerifyOtpController(),
    );
  }
}
