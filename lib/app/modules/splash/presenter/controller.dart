import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/constants/storage_keys.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/storage.dart';
import '../../../core/usecase/usecase.dart';
import '../domain/usecase/get_token.dart';

class SplashController extends GetxController {
  final GetToken getToken;
  SplashController(this.getToken);

  @override
  void onInit() {
    handleRedirect();
    super.onInit();
  }

  Future<void> handleRedirect() async {
    final res = await getToken(NoParams());
    final isFirstAppOpen =
        Get.find<IStorageService>().readBool(StorageKeys.firstAppOpen);
    await Future.delayed(const Duration(seconds: 1));
    res.fold(
      (l) => log(l.toString()),
      (token) => Get.offAllNamed(
          isFirstAppOpen == false ? Routes.home : Routes.about,
          arguments: token),
    );
  }
}
