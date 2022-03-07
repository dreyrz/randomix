import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomix/app/core/routes/routes.dart';

import 'controller.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      onGenerateRoute: (settings) {
        return controller.tabNavigator.onRouteChanged(
          settings: settings,
          firstTabRoute: Routes.history,
          basePage: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => TextButton(
                    onPressed: () => controller.count.value++,
                    child: Text("Count ${controller.count}"),
                  )),
              TextButton(
                onPressed: () => Get.toNamed(Routes.about, id: 1),
                child: const Text("navegar"),
              ),
            ],
          ),
        );
      },
    );
  }
}
