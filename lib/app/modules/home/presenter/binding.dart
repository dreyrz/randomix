import 'package:get/get.dart';

import 'package:randomix/app/modules/home/domain/repositories/repository_interface.dart';
import 'package:randomix/app/modules/home/domain/usecases/get_random_track_by_genre.dart';
import 'package:randomix/app/modules/home/external/spotify/datasource/home_datasource.dart';
import 'package:randomix/app/modules/home/infra/repositories/repository.dart';

import '../../../core/services/api.dart';
import '../infra/datasources/home_datasource_interface.dart';
import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeDatasource>(() => HomeDataSource(Get.find<IApi>()));
    Get.lazyPut<IHomeRepository>(() => HomeRepository(Get.find()));
    Get.lazyPut<GetRandomTrackByGenre>(() => GetRandomTrackByGenre(Get.find()));
    Get.put<HomeController>(HomeController(Get.find()));
  }
}
