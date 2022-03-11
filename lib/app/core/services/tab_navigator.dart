import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../routes/pages.dart';
import '../routes/routes.dart';

abstract class ITabNavigatorService {
  Rx<int> get currentTab;
  void goToTab(int tab);
  PageRoute onRouteChanged({
    required RouteSettings settings,
    required String firstTabRoute,
    required Widget basePage,
  });
}

class TabNavigatorService extends GetxService implements ITabNavigatorService {
  final _currentTab = Rx<int>(0);

  @override
  Rx<int> get currentTab => _currentTab;

  @override
  void goToTab(int tab) {
    _currentTab.value = tab;
  }

  @override
  PageRoute onRouteChanged({
    required RouteSettings settings,
    required String firstTabRoute,
    required Widget basePage,
  }) {
    if (settings.name != firstTabRoute && settings.name != Routes.base) {
      final route = Pages.routes.firstWhere((p) => p.name == settings.name);
      return GetPageRoute(page: route.page, binding: route.binding);
    } else {
      return GetPageRoute(page: () => basePage);
    }
  }
}
