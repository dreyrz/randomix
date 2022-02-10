import 'package:get/get.dart';

import '../../../core/routes/routes.dart';

class AboutController extends GetxController {
  void navigateToHome() {
    final token = Get.arguments;
    Get.offAllNamed(Routes.home, arguments: token);
  }
}
