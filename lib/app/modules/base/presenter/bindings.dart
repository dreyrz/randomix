import 'package:get/get.dart';

import '../../home/presenter/binding.dart';
import '../../library/presenter/bindings.dart';
import 'controller.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BaseController>(
      BaseController(
        Get.find(),
        Get.find(),
        HomeBinding(),
        LibraryBinding(),
      ),
      permanent: true,
    );
  }
}
