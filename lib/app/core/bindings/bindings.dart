import 'package:get/get.dart';

import '../config/config.dart';
import '../constants/_constants.dart';
import '../services/_services.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IApi>(DioApi(baseUrl: Config.baseUrl));
    Get.put<ITabNavigator>(TabNavigator());
    Get.put<IStorageService>(StorageService());
    Get.put<IStrings>(BrazilianPortugueseStrings());
    Get.put<IAuthentication>(AuthenticationService());
  }
}
