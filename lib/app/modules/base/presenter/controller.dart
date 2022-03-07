import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomix/app/modules/history/presenter/bindings.dart';

import '../../../core/services/api.dart';
import '../../../core/services/tab_navigator.dart';
import '../../history/presenter/page.dart';
import '../../home/presenter/binding.dart';
import '../../home/presenter/page.dart';
import 'state.dart';

class BaseController extends GetxController with BaseState {
  final ITabNavigator tabNavigator;
  final HomeBinding homeBinding;
  final HistoryBinding historyBinding;
  BaseController(this.tabNavigator, this.homeBinding, this.historyBinding);

  @override
  void onInit() {
    homeBinding.dependencies();
    historyBinding.dependencies();
    pages.value = [
      const HomePage(),
      const HistoryPage(),
    ];
    _setToken();
    super.onInit();
  }

  void _setToken() {
    final token = Get.arguments;
    Get.find<IApi>().headers = {"Authorization": "Bearer $token"};
  }

  Future<bool> onWillPop() async {
    final value = !await Navigator.maybePop(
        Get.nestedKey(tabNavigator.currentTab)!.currentState!.context);

    return value;
  }
}
