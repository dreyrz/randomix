import 'package:get/get.dart';
import 'package:randomix/app/modules/history/presenter/bindings.dart';
import 'package:randomix/app/modules/home/presenter/binding.dart';

import 'controller.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BaseController>(BaseController(
      Get.find(),
      HomeBinding(),
      HistoryBinding(),
    ));
  }
}
