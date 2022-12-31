import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/_constants.dart';
import '../../../core/routes/routes.dart';
import '../../../core/widgets/_widgets.dart';
import 'controller.dart';
import 'widgets/genres_dropdown.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      // initialRoute: Routes.home,
      key: Get.nestedKey(0),
      onGenerateRoute: (settings) {
        return controller.tabNavigator.onRouteChanged(
            settings: settings,
            firstTabRoute: Routes.home,
            basePage: Obx(() => Scaffold(
                  appBar: HomeAppBar(
                    isNotificationsEnabled:
                        controller.isNotificationsEnabled.value,
                    onNotificationIconPressed: () async =>
                        controller.enableNotifications(context),
                  ),
                  body: Container(
                    color: Theme.of(context).backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Clique para obter uma música!',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          const Spacer(flex: 35),
                          SizedBox(
                            height: 300,
                            child: CircularButton(
                              svgPath: SvgPath.shuffle,
                              onPressed: () async =>
                                  await controller.getRandomTrack(context),
                            ),
                          ),
                          const Spacer(flex: 5),
                          GenresDropDown(
                            controller.genresList,
                            controller.setGenreSelected,
                          ),
                          const Spacer(flex: 55),
                        ],
                      ),
                    ),
                  ),
                )));
      },
    );
  }
}
