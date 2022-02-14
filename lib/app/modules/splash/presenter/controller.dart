import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/services/api.dart';
import '../../../core/config/config.dart';
import '../../../core/routes/routes.dart';

import '../domain/usecases/get_token.dart';

class SplashController extends GetxController {
  final GetToken getToken;
  SplashController(this.getToken);

  @override
  void onInit() {
    getAuth();
    super.onInit();
  }

  Future<void> getAuth() async {
    final res = await getToken();

    await Future.delayed(const Duration(seconds: 1));
    res.fold(
      (l) => log(l.toString()),
      (token) {
        Get.find<IApi>().baseUrl = Config.baseUrl;
        Get.offAllNamed(Routes.about, arguments: token);
      },
    );
  }
}
