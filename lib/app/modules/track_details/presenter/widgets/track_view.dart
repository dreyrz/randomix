import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomix/app/modules/track_details/presenter/controller.dart';

import '../../../../core/entities/_entities.dart';
import 'track_cover.dart';
import 'track_info.dart';
import 'track_player.dart';

class TrackView extends StatelessWidget {
  final TrackDetailsController controller;
  final Track track;

  const TrackView({
    required this.controller,
    required this.track,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        TrackCover(track: track),
        TrackInfo(track: track),
        Obx(
          () => TrackPlayer(
            track: track,
            duration: controller.duration.value,
            status: controller.status.value,
            onPlayPressed: () => controller.playTrack(track.previewUrl!),
            onPausePressed: () => controller.pauseTrack(),
            onSkippedBackwards: controller.skipBackwards,
            onSkippedForward: controller.skipForward,
            onSeekedPosition: controller.seekPosition,
          ),
        ),
      ],
    );
  }
}
