import 'package:get/get.dart';
import 'package:randomix/app/core/constants/storage_keys.dart';
import 'package:randomix/app/core/services/storage.dart';
import '../../../core/routes/routes.dart';

class AboutController extends GetxController {
  void navigateToHome() async {
    final token = Get.arguments;
    Get.offAllNamed(Routes.home, arguments: token);
    await _handleFirstAppOpen();
  }

  Future<void> _handleFirstAppOpen() async {
    await Get.find<IStorageService>().setBool(StorageKeys.firstAppOpen, false);
  }
}
