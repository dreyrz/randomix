import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes.dart';
import '../../../core/widgets/button.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Randomix"), actions: [
        IconButton(
          color: Get.theme.secondaryHeaderColor,
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        IconButton(
          color: Get.theme.secondaryHeaderColor,
          icon: const Icon(Icons.settings),
          onPressed: () {},
        )
      ]),
      body: Navigator(
        initialRoute: Routes.home,
        key: Get.nestedKey(0),
        onGenerateRoute: (settings) {
          return controller.tabNavigator.onRouteChanged(
            settings: settings,
            firstTabRoute: Routes.home,
            basePage: Container(
              color: Get.theme.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 5),
                    Text(
                      controller.getGreetingString(),
                      style: Get.theme.textTheme.headline2,
                    ),
                    const Spacer(flex: 5),
                    Expanded(
                      flex: 80,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.trackList.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(
                              controller.trackList[index].name,
                              style: Get.theme.textTheme.headline3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 5),
                    Button(
                      title: "get pop track",
                      onPressed: () => controller.getRandomTrackByGenre('pop'),
                    ),
                    const Spacer(flex: 5),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
