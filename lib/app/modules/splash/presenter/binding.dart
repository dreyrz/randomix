import 'package:get/get.dart';

import '../../../core/utils/usecase.dart';
import '../domain/repositories/repository_interface.dart';
import '../domain/usecases/get_genres.dart';
import '../domain/usecases/get_token.dart';
import '../external/spotify/datasources/datasource.dart';
import '../infra/datasources/splash_datasource_interface.dart';
import '../infra/repositories/repository.dart';
import 'controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ISplashDatasource>(SplashDatasource(Get.find()));
    Get.put<ISplashRepository>(SplashRepository(Get.find()));
    Get.put<IUseCaseNoParams<String>>(
      GetToken(Get.find(), Get.find()),
    );
    Get.put<IUseCaseNoParams<List<String>>>(GetGenres(Get.find()));
    Get.put<SplashController>(SplashController(
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
    ));
  }
}
