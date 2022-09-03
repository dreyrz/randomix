import 'dart:math';

import 'package:get/get.dart';
import 'package:randomix/app/core/services/background_task.dart';

import '../../../core/entities/_entities.dart';
import '../../../core/utils/usecase.dart';

import '../domain/repositories/repository_interface.dart';
import '../domain/usecases/get_random_track_by_genre.dart';
import '../external/datasources/datasource.dart';
import '../infra/datasources/home_datasource_interface.dart';
import '../infra/repositories/repository.dart';
import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final IBackgroundTaskService backgroundTaskService =
        BackgroundTaskService();
    Get.lazyPut<IHomeDatasource>(() => HomeDataSource(Get.find()));
    Get.lazyPut<IHomeRepository>(() => HomeRepository(Get.find()));
    Get.lazyPut<IUseCaseParams<String, Track>>(
        () => GetRandomTrackByGenre(Get.find()));

    Get.put<HomeController>(HomeController(
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
      backgroundTaskService,
      Random(),
    ));
  }
}
