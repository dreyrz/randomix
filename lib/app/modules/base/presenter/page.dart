import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomix/app/modules/base/presenter/widgets/custom_bottom_navigation_bar.dart';

import 'controller.dart';

class BasePage extends GetView<BaseController> {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () => Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: controller.tabNavigator.currentTab.value,
            children: controller.pages,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            controller.tabNavigator,
            controller.trackListService,
          ),
        ),
      ),
    );
  }
}
