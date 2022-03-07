import 'package:get/get.dart';

import '../../../core/constants/_constants.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/_services.dart';

class AboutController extends GetxController {
  void navigateToHome() async {
    await _handleFirstAppOpen();
    Get.offAllNamed(Routes.home);
  }

  Future<void> _handleFirstAppOpen() async {
    await Get.find<IStorageService>().setBool(StorageKeys.firstAppOpen, false);
  }
}
