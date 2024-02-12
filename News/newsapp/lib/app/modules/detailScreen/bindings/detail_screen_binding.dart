import 'package:get/get.dart';

import '../controllers/detail_screen_controller.dart';

class DetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailScreenController>(
      () => DetailScreenController(),
    );
  }
}
