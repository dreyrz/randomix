import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes.dart';
import '../widgets/animated_circular_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/genres_dropdown.dart';
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
                      child: AnimatedCircularButton(
                        onPressed: () async =>
                            await controller.getRandomTrack(),
                      ),
                    ),
                    const Spacer(flex: 5),
                    GenresDropDown(
                      controller.genresList,
                      controller.onGenreSelected,
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
