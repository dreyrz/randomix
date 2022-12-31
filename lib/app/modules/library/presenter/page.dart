import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/_constants.dart';
import '../../../core/routes/routes.dart';
import '../widgets/track_tile.dart';
import 'controller.dart';

class LibraryPage extends GetView<LibraryController> {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      onGenerateRoute: (settings) {
        return controller.tabNavigator.onRouteChanged(
          settings: settings,
          firstTabRoute: Routes.library,
          basePage: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const Spacer(flex: 5),
                  Text('Músicas recentes',
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer(flex: 5),
                  Expanded(
                    flex: 90,
                    child: Obx(
                      () => controller.tracks.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  SvgPath.empty,
                                  height: 250,
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  'Você ainda não tem músicas na sua biblioteca',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline3,
                                )
                              ],
                            )
                          : ListView.builder(
                              itemCount: controller.tracks.length,
                              itemBuilder: ((context, index) =>
                                  TrackTile(track: controller.tracks[index])),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
