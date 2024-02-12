import 'package:get/get.dart';

import '../controllers/new_home_controller.dart';

class NewHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewHomeController>(
      () => NewHomeController(),
    );
  }
}
