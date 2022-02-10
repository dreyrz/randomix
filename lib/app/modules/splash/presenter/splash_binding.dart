import 'package:get/get.dart';

import '../domain/repositories/splash_repository_interface.dart';
import '../domain/usecase/get_token.dart';
import '../external/spotify/datasource/splash_datasource.dart';
import '../infra/datasources/splash_datasource_interface.dart';
import '../infra/repositories/splash_repository.dart';
import 'splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ISplashDatasource>(() => SplashDatasource(Get.find()));
    Get.lazyPut<ISplashRepository>(() => SplashRepository(Get.find()));
    Get.lazyPut<GetToken>(() => GetToken(Get.find()));
    Get.put<SplashController>(SplashController(Get.find()));
  }
}
