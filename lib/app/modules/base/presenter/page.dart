import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class BasePage extends GetView<BaseController> {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.tabNavigator.currentTab.value,
            children: controller.pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Get.theme.secondaryHeaderColor,
            elevation: 0,
            onTap: (i) => controller.tabNavigator.goToTab(i),
            currentIndex: controller.tabNavigator.currentTab.value,
            items: [
              BottomNavigationBarItem(
                label: 'Início',
                icon: Icon(controller.tabNavigator.currentTab.value == 0
                    ? Icons.home
                    : Icons.home_outlined),
              ),
              const BottomNavigationBarItem(
                label: 'Histórico',
                icon: Icon(Icons.history),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
