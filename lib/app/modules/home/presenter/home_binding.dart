import 'package:get/get.dart';

import 'package:randomix/app/modules/home/domain/repositories/home_repository_interface.dart';
import 'package:randomix/app/modules/home/domain/usecases/get_random_track_by_genre.dart';
import 'package:randomix/app/modules/home/external/spotify/datasource/home_datasource.dart';
import 'package:randomix/app/modules/home/infra/repositories/home_repository.dart';

import '../../../core/config/config.dart';
import '../../../core/api/api.dart';
import '../infra/datasources/home_datasource_interface.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IApi>(() => DioApi(baseUrl: Config.baseUrl));
    Get.lazyPut<IHomeDatasource>(() => HomeDataSource(Get.find()));
    Get.lazyPut<IHomeRepository>(() => HomeRepository(Get.find()));
    Get.lazyPut<GetRandomTrackByGenre>(() => GetRandomTrackByGenre(Get.find()));
    Get.put<HomeController>(HomeController(Get.find()));
  }
}
