import 'package:flutter/material.dart';
import 'package:randomix/app/modules/base/presenter/controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final BaseController controller;
  const CustomBottomNavigationBar(this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      unselectedItemColor: Theme.of(context).backgroundColor,
      selectedItemColor: Theme.of(context).backgroundColor,
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
    );
  }
}
