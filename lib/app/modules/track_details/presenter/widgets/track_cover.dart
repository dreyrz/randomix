import 'package:flutter/material.dart';

import '../../../../core/entities/_entities.dart';

class TrackCover extends StatelessWidget {
  final Track track;
  const TrackCover({Key? key, required this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Image.network(track.album!.albumCover!),
    );
  }
}
