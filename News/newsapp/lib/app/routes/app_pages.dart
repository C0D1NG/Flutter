import 'package:get/get.dart';

import '../modules/auth/login/bindings/auth_login_binding.dart';
import '../modules/auth/login/views/auth_login_view.dart';
import '../modules/auth/signup/bindings/auth_signup_binding.dart';
import '../modules/auth/signup/views/auth_signup_view.dart';
import '../modules/auth/verify-otp/bindings/auth_verify_otp_binding.dart';
import '../modules/auth/verify-otp/views/auth_verify_otp_view.dart';
import '../modules/detailScreen/bindings/detail_screen_binding.dart';
import '../modules/detailScreen/views/detail_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/network_error/bindings/network_error_binding.dart';
import '../modules/network_error/views/network_error_view.dart';
import '../modules/new_home/bindings/new_home_binding.dart';
import '../modules/new_home/views/new_home_view.dart';
import '../modules/search_screen/bindings/search_screen_binding.dart';
import '../modules/search_screen/views/search_screen_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH_LOGIN,
      page: () => const AuthLoginView(),
      binding: AuthLoginBinding(),
    ),
    GetPage(
      name: Routes.AUTH_VERIFY_OTP,
      page: () => const AuthVerifyOtpView(),
      binding: AuthVerifyOtpBinding(),
    ),
    GetPage(
      name: Routes.AUTH_SIGNUP,
      page: () => const AuthSignupView(),
      binding: AuthSignupBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: Routes.HOME_SCREEN,
        page: () => HomeScreenView(),
        binding: HomeScreenBinding(),
        arguments: []),
    GetPage(
      name: Routes.NEW_HOME,
      page: () => NewHomeView(),
      binding: NewHomeBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_SCREEN,
      page: () => const DetailScreenView(),
      binding: DetailScreenBinding(),
    ),
    GetPage(
      name: Routes.NETWORK_ERROR,
      page: () => const NetworkErrorView(),
      binding: NetworkErrorBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_SCREEN,
      page: () =>  SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
  ];
}
