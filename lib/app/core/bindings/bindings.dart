import 'package:get/get.dart';

import '../api/api.dart';
import '../config/config.dart';
import '../services/storage.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IApi>(() => DioApi(baseUrl: Config.baseUrl));
    Get.lazyPut<IStorageService>(() => StorageService());
  }
}
