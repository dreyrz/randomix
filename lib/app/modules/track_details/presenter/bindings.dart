import 'package:get/get.dart';

import '../../../core/services/_services.dart';
import 'controller.dart';

class TrackDetailsBinding implements Bindings {
  @override
  void dependencies() {
    final IPlayer player = Player();
    Get.lazyPut<TrackDetailsController>(
      () => TrackDetailsController(player),
    );
  }
}
