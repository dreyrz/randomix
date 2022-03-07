import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/config/config.dart';
import '../../../core/constants/storage_keys.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/api.dart';
import '../../../core/services/authentication.dart';
import '../../../core/services/storage.dart';
import '../../../core/utils/usecase.dart';

class SplashController extends GetxController {
  final IUseCaseNoParams getToken;
  SplashController(this.getToken);

  @override
  void onInit() {
    handleRedirect();
    super.onInit();
  }

  Future<void> handleRedirect() async {
    final res = await getToken();
    final isFirstAppOpen =
        Get.find<IStorageService>().readBool(StorageKeys.firstAppOpen);
    await Future.delayed(const Duration(seconds: 1));
    res.fold(
      (l) => log(l.toString()),
      (token) {
        Get.find<IAuthentication>().setToken(token);
        Get.find<IApi>().baseUrl = Config.baseUrl;
        Get.offAllNamed(isFirstAppOpen == false ? Routes.base : Routes.about);
      },
    );
  }
}
