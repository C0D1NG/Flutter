import 'package:get/get.dart';

import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/request/auth_request.dart';
import 'package:starter/app/data/repository/user_repository.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/base/base_controller.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';
import 'package:starter/utils/helper/validators.dart';
import 'package:starter/utils/loading/loading_utils.dart';

class AuthLoginController extends BaseController<UserRepository> {
  final mobileWrapper = TextFieldWrapper();

  sendOTP() async {
    String mobile = mobileWrapper.controller.text.trim();
    if (mobile.isValidPhone()) {
      mobileWrapper.errorText = Strings.empty;
    } else {
      mobileWrapper.errorText = ErrorMessages.invalidPhone;
      return;
    }

    LoadingUtils.showLoader();
    RepoResponse<bool> response =
        await repository.sendOTP(SendOTPRequest(phone: mobile));
    LoadingUtils.hideLoader();

    if (response.data ?? false) {
      Get.toNamed(Routes.AUTH_VERIFY_OTP, arguments: mobile);
    } else {
      mobileWrapper.errorText = response.error?.message ?? "";
    }
  }
}
