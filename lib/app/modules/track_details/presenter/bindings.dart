import 'package:get/get.dart';

import '../../../core/services/_services.dart';
import 'controller.dart';

class TrackDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackDetailsController>(() => TrackDetailsController(
          Get.find<IPlayer>(),
        ));
  }
}
