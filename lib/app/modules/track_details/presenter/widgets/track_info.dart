import 'package:flutter/material.dart';

import '../../../../core/entities/_entities.dart';
import '../../../../core/widgets/scrolling_text.dart';

class TrackInfo extends StatelessWidget {
  final Track track;
  const TrackInfo({required this.track, Key? key}) : super(key: key);
  String get formattedText => (track.artists!.map((a) => a.name))
      .toString()
      .replaceAll("(", "")
      .replaceAll(")", "");
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: SizedBox(
            height: 36,
            child: track.name!.length > 30
                ? ScrollingText(text: track.name!)
                : Text(
                    track.name!,
                    style: Theme.of(context).textTheme.headline3,
                  ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 36,
            child: track.artists!.length > 2
                ? ScrollingText(text: formattedText)
                : Text(
                    formattedText,
                    style: Theme.of(context).textTheme.headline3,
                  ),
          ),
        )
      ],
    );
  }
}
