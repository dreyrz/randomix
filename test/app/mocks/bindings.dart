import 'package:get/get.dart';
import 'package:randomix/app/core/services/api.dart';

import 'services.dart';

class MockInitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IApi>(() => ApiMock());
  }
}
