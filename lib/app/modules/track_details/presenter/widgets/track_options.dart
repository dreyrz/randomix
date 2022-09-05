import 'package:flutter/material.dart';

import '../../../../core/utils/png_path.dart';

class TrackOptions extends StatelessWidget {
  final VoidCallback onTap;
  const TrackOptions({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  Future<void> show(
    BuildContext context, {
    bool barrierDismissible = false,
  }) async {
    return await showModalBottomSheet(
      context: context,
      builder: (_) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
            leading: Image.asset(PngPath.spotifyIconBlack, height: 32),
            title: Text(
              'Abrir no spotify',
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: onTap),
      ],
    );
  }
}
