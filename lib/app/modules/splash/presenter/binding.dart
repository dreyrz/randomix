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
  static const getTokenTag = 'getToken';
  static const getGenresTag = 'getGenres';
  @override
  void dependencies() {
    Get.lazyPut<ISplashDatasource>(() => SplashDatasource(Get.find()));
    Get.lazyPut<ISplashRepository>(() => SplashRepository(Get.find()));
    Get.lazyPut<IUseCaseNoParams>(
      () => GetToken(Get.find()),
      tag: getTokenTag,
    );
    Get.lazyPut<IUseCaseNoParams>(
      () => GetGenres(Get.find()),
      tag: getGenresTag,
    );
    Get.put<SplashController>(SplashController(
      Get.find(tag: getTokenTag),
      Get.find(tag: getGenresTag),
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
    ));
  }
}
