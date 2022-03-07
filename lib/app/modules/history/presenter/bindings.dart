import 'package:get/get.dart';
import 'package:randomix/app/modules/history/presenter/controller.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HistoryController(Get.find()));
  }
}
