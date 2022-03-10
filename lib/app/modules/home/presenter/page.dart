import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes.dart';
import '../widgets/animated_circular_button.dart';
import '../widgets/custom_app_bar.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Navigator(
        initialRoute: Routes.home,
        key: Get.nestedKey(0),
        onGenerateRoute: (settings) {
          return controller.tabNavigator.onRouteChanged(
            settings: settings,
            firstTabRoute: Routes.home,
            basePage: Container(
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 10),
                    Text(
                      'Clique para obter uma música!',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const Spacer(flex: 35),
                    Align(
                      alignment: Alignment.center,
                      child: AnimatedCircularButton(
                        onPressed: () async =>
                            await controller.getRandomTrackByGenre('pop'),
                      ),
                    ),
                    const Spacer(flex: 55),
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
