import 'package:flutter/material.dart';

import '../../../../core/services/_services.dart';
import '../../../../core/widgets/circular_button.dart';

class PlayerButton extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onPausePressed;
  final PlayerStatus status;
  const PlayerButton({
    Key? key,
    required this.onPlayPressed,
    required this.onPausePressed,
    required this.status,
  }) : super(key: key);

  IconData handleIcon() {
    if (status == PlayerStatus.stopped ||
        status == PlayerStatus.paused ||
        status == PlayerStatus.completed) {
      return Icons.play_arrow;
    }
    return Icons.pause;
  }

  VoidCallback handleOnPressed() {
    if (status == PlayerStatus.stopped ||
        status == PlayerStatus.paused ||
        status == PlayerStatus.completed) {
      return onPlayPressed;
    }
    return onPausePressed;
  }

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      size: 64,
      color: Theme.of(context).secondaryHeaderColor,
      onPressed: handleOnPressed(),
      icon: handleIcon(),
    );
  }
}
