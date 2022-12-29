import 'package:get/get.dart';
import 'package:randomix/app/modules/home/domain/usecases/home_usecase_factory.dart';

import '../../../core/services/_services.dart';
import 'controller.dart';

class TrackDetailsBinding implements Bindings {
  @override
  void dependencies() {
    final IPlayer player = Player();
    Get.lazyPut<TrackDetailsController>(
      () => TrackDetailsController(
        player,
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        HomeUseCaseFactory(Get.find()),
      ),
    );
  }
}
