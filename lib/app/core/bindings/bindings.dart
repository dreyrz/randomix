import 'package:get/get.dart';

import '../config/config.dart';
import '../constants/strings.dart';
import '../services/_services.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IStorageService>(StorageService());
    Get.put<IApi>(ApiService(baseUrl: Config.baseUrl));
    Get.put<ITabNavigatorService>(TabNavigatorService());
    Get.put<IStrings>(BrazilianPortugueseStrings());
    Get.put<IAuthenticationService>(AuthenticationService());
    Get.put<ITrackListService>(TrackListService());
    Get.put<IGenresListService>(GenresListService(Get.find<IStrings>().random));
  }
}
