import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'widgets/track_details_app_bar.dart';
import 'widgets/track_options.dart';
import 'widgets/track_view.dart';

class TrackDetailsPage extends GetView<TrackDetailsController> {
  const TrackDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: TrackDetailsAppBar(
          title: controller.currentTrack.value.genre,
          onIconTap: () async =>
              await TrackOptions(onTap: controller.openSpotify).show(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TrackView(
            controller: controller,
            track: controller.currentTrack.value,
          ),
        ),
      ),
    );
  }
}
