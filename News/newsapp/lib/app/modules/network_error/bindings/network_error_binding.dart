import 'package:get/get.dart';

import '../controllers/network_error_controller.dart';

class NetworkErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkErrorController>(
      () => NetworkErrorController(),
    );
  }
}
