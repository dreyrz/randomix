import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomix/app/modules/library/widgets/track_tile.dart';

import '../../../core/routes/routes.dart';
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
            child: Column(
              children: [
                const Spacer(flex: 5),
                Text('Músicas recentes',
                    style: Theme.of(context).textTheme.headline2),
                const Spacer(flex: 5),
                Expanded(
                  flex: 90,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.tracks.length,
                      itemBuilder: ((context, index) =>
                          TrackTile(track: controller.tracks[index])),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
