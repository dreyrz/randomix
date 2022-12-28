import 'package:get/get.dart';

import '../../library/presenter/controller.dart';

class LibraryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LibraryController(
      Get.find(),
      Get.find(),
      Get.find(),
    ));
  }
}
