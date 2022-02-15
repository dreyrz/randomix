import 'package:get/get.dart';

import '../domain/repositories/repository_interface.dart';
import '../domain/usecases/get_token.dart';
import '../external/spotify/datasources/datasource.dart';
import '../infra/datasources/splash_datasource_interface.dart';
import '../infra/repositories/repository.dart';
import 'controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ISplashDatasource>(() => SplashDatasource(Get.find()));
    Get.lazyPut<ISplashRepository>(() => SplashRepository(Get.find()));
    Get.lazyPut<GetToken>(() => GetToken(Get.find()));
    Get.put<SplashController>(SplashController(Get.find()));
  }
}
