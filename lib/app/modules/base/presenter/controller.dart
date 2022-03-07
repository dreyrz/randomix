import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/_services.dart';
import '../../home/presenter/binding.dart';
import '../../home/presenter/page.dart';
import '../../library/presenter/bindings.dart';
import '../../library/presenter/page.dart';
import 'state.dart';

class BaseController extends GetxController with BaseState {
  final ITabNavigator tabNavigator;
  final HomeBinding homeBinding;
  final LibraryBinding historyBinding;
  BaseController(this.tabNavigator, this.homeBinding, this.historyBinding);

  @override
  void onInit() {
    homeBinding.dependencies();
    historyBinding.dependencies();
    pages.value = [
      const HomePage(),
      const LibraryPage(),
    ];
    _setToken();
    super.onInit();
  }

  void _setToken() {
    final token = Get.find<IAuthentication>().token;
    Get.find<IApi>().headers = {"Authorization": "Bearer $token"};
  }

  Future<bool> onWillPop() async {
    final value = !await Navigator.maybePop(
        Get.nestedKey(tabNavigator.currentTab)!.currentState!.context);

    return value;
  }
}
