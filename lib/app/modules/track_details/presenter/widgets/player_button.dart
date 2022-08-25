import 'package:flutter/material.dart';

import '../../../../core/services/_services.dart';
import '../../../home/presenter/widgets/circular_button.dart';

class PlayerButton extends StatefulWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onPausePressed;
  final PlayerStatus status;
  const PlayerButton({
    Key? key,
    required this.onPlayPressed,
    required this.onPausePressed,
    required this.status,
  }) : super(key: key);

  @override
  State<PlayerButton> createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton> {
  IconData handleIcon() {
    if (widget.status == PlayerStatus.stopped ||
        widget.status == PlayerStatus.paused ||
        widget.status == PlayerStatus.completed) {
      return Icons.play_arrow;
    }
    return Icons.pause;
  }

  VoidCallback handleOnPressed() {
    if (widget.status == PlayerStatus.stopped ||
        widget.status == PlayerStatus.paused ||
        widget.status == PlayerStatus.completed) {
      return widget.onPlayPressed;
    }
    return widget.onPausePressed;
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
