import 'package:get/get.dart';

import '../../../core/constants/_constants.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/_services.dart';

class AboutController extends GetxController {
  final IStorageService _storageService;
  AboutController(this._storageService);

  void navigateToHome() async {
    await _handleFirstAppOpen();
    Get.offAllNamed(Routes.home);
  }

  Future<void> _handleFirstAppOpen() async {
    await _storageService.setBool(StorageKeys.firstAppOpen, false);
  }
}
