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
            selectedItemColor: Theme.of(context).secondaryHeaderColor,
            elevation: 0,
            onTap: (i) => controller.tabNavigator.goToTab(i),
            currentIndex: controller.tabNavigator.currentTab.value,
            items: [
              BottomNavigationBarItem(
                label: 'Início',
                icon: Icon(
                  controller.tabNavigator.currentTab.value == 0
                      ? Icons.home
                      : Icons.home_outlined,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Biblioteca',
                icon: Icon(
                  controller.tabNavigator.currentTab.value == 1
                      ? Icons.library_music
                      : Icons.library_music_outlined,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
