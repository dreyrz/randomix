import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/entities/_entities.dart';
import '../../../core/routes/_routes.dart';
import '../../../core/widgets/_widgets.dart';

class TrackTile extends StatelessWidget {
  final Track track;

  const TrackTile({required this.track, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: () {
          Get.toNamed(Routes.trackDetails, arguments: track);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: CustomImage(
                track.album!.cover!,
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    track.name!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    track.artistsName,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    track.album!.name!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
