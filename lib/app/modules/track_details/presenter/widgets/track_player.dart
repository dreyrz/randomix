import 'package:flutter/material.dart';

import '../../../../core/entities/_entities.dart';
import '../../../../core/services/_services.dart';

import 'player_button.dart';

class TrackPlayer extends StatefulWidget {
  final Track track;
  final Duration duration;
  final PlayerStatus status;
  final VoidCallback onPlayPressed;
  final VoidCallback onPausePressed;
  final void Function(Duration) onSeekedPosition;

  const TrackPlayer({
    Key? key,
    required this.track,
    required this.duration,
    required this.status,
    required this.onPlayPressed,
    required this.onPausePressed,
    required this.onSeekedPosition,
  }) : super(key: key);

  @override
  State<TrackPlayer> createState() => _TrackPlayerState();
}

class _TrackPlayerState extends State<TrackPlayer> {
  late double _position;
  double _selectedPosition = 0;
  double _thumbRadius = 0;
  bool _isChangingPosition = false;

  @override
  void initState() {
    _position = widget.duration.inSeconds.toDouble();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TrackPlayer oldWidget) {
    if (oldWidget.duration != widget.duration) {
      _position = widget.duration.inSeconds.toDouble();
    }
    super.didUpdateWidget(oldWidget);
  }

  String get formatPosition =>
      '00:${_position.truncate().toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: widget.track.previewUrl != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 3,
                      thumbColor: Colors.red,
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: _thumbRadius)),
                  child: Slider(
                    thumbColor: Theme.of(context).secondaryHeaderColor,
                    activeColor: Theme.of(context).secondaryHeaderColor,
                    inactiveColor:
                        Theme.of(context).secondaryHeaderColor.withAlpha(75),
                    min: 0,
                    max: 29,
                    value: _isChangingPosition ? _selectedPosition : _position,
                    divisions: null,
                    onChangeStart: (s) {
                      _isChangingPosition = true;
                      _thumbRadius = 10;
                    },
                    onChangeEnd: (p) {
                      setState(() {
                        _position = p;
                        widget.onSeekedPosition(
                          Duration(
                            seconds: p.truncate(),
                            milliseconds: (p - p.truncate()).toInt(),
                          ),
                        );
                        _isChangingPosition = false;
                        _thumbRadius = 0;
                      });
                    },
                    onChanged: (p) {
                      setState(() {
                        _selectedPosition = p;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatPosition,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            '00:29',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PlayerButton(
                            onPlayPressed: widget.onPlayPressed,
                            onPausePressed: widget.onPausePressed,
                            status: widget.status,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          : const SizedBox(),
    );
  }
}
