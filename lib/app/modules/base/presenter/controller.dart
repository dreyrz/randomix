import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/entities/track.dart';
import '../../../core/services/_services.dart';
import '../../home/presenter/page.dart';
import '../../library/presenter/page.dart';
import 'state.dart';

class BaseController extends GetxController with BaseState {
  final ITabNavigatorService tabNavigator;
  final ITrackListService trackListService;
  final Bindings homeBinding;
  final Bindings historyBinding;
  BaseController(
    this.tabNavigator,
    this.trackListService,
    this.homeBinding,
    this.historyBinding,
  );

  @override
  void onInit() {
    _handleArguments();
    homeBinding.dependencies();
    historyBinding.dependencies();
    pages.value = [
      const HomePage(),
      const LibraryPage(),
    ];

    super.onInit();
  }

  void _handleArguments() {
    final args = Get.arguments;
    if (args != null) {
      trackListService.addTrack(Track.fromJson(args));
    }
  }

  Future<bool> onWillPop() async {
    final value = !await Navigator.maybePop(
        Get.nestedKey(tabNavigator.currentTab)!.currentState!.context);

    return value;
  }
}
