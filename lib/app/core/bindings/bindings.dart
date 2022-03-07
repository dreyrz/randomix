import 'package:get/get.dart';

import '../config/config.dart';
import '../constants/strings.dart';
import '../services/api.dart';
import '../services/authentication.dart';
import '../services/storage.dart';
import '../services/tab_navigator.dart';

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
