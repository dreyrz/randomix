import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomix/app/modules/track_details/presenter/widgets/track_options.dart';

import 'controller.dart';
import 'widgets/track_cover.dart';
import 'widgets/track_details_app_bar.dart';
import 'widgets/track_info.dart';
import 'widgets/track_player.dart';

class TrackDetailsPage extends GetView<TrackDetailsController> {
  const TrackDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TrackDetailsAppBar(
        onIconTap: () async =>
            await TrackOptions(onTap: controller.openSpotify).show(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            TrackCover(track: controller.track),
            TrackInfo(track: controller.track),
            Obx(
              () => TrackPlayer(
                track: controller.track,
                onPlayPressed: () =>
                    controller.playTrack(controller.track.previewUrl!),
                onPausePressed: () => controller.pauseTrack(),
                onSeekedPosition: controller.seekPosition,
                duration: controller.duration.value,
                status: controller.status.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
