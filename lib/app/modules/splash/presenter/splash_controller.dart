import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/routes/routes.dart';
import '../../../core/usecase/usecase.dart';
import '../domain/usecase/get_token.dart';

class SplashController extends GetxController {
  final GetToken getToken;
  SplashController(this.getToken);

  @override
  void onInit() {
    getAuth();
    super.onInit();
  }

  Future<void> getAuth() async {
    final res = await getToken(NoParams());

    await Future.delayed(const Duration(seconds: 1));
    res.fold(
      (l) => log(l.toString()),
      (token) => Get.offAllNamed(Routes.home, arguments: token),
    );
  }
}
