import 'package:get/get.dart';

import '../../../core/services/api.dart';
import '../../../core/utils/usecase.dart';
import '../domain/repositories/repository_interface.dart';
import '../domain/usecases/get_random_track_by_genre.dart';
import '../external/spotify/datasources/datasource.dart';
import '../infra/datasources/home_datasource_interface.dart';
import '../infra/repositories/repository.dart';
import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeDatasource>(() => HomeDataSource(Get.find<IApi>()));
    Get.lazyPut<IHomeRepository>(() => HomeRepository(Get.find()));
    Get.lazyPut<IUseCase>(() => GetRandomTrackByGenre(Get.find()));
    Get.put<HomeController>(HomeController(Get.find(), Get.find(), Get.find()));
  }
}
