import 'package:get/get.dart';

import '../services/api.dart';
import '../config/config.dart';
import '../services/storage.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IApi>(DioApi(baseUrl: Config.baseUrl));
    Get.put<IStorageService>(StorageService());
  }
}
