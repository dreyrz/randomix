import 'package:get/get.dart';

import '../../../core/services/_services.dart';
import 'state.dart';

class TrackDetailsController extends GetxController with TrackDetailsState {
  final IPlayer _player;
  TrackDetailsController(this._player) {
    track = Get.arguments;
    _addCallbacks();
  }

  Future<void> playTrack(String url) async {
    await _player.play(url);
  }

  Future<void> pauseTrack() async {
    await _player.pause();
  }

  Future<void> resumeTrack() async {
    await _player.resume();
  }

  Future<void> seekPosition(Duration duration) async {
    await _player.seek(duration);
  }

  void _addCallbacks() {
    _player.onPositionChanged(onPlaying);
    _player.onStateChanged(onStatusChanged);
  }

  void onPlaying(Duration duration) {
    this.duration.value = duration;
  }

  void onStatusChanged(PlayerStatus status) {
    this.status.value = status;
  }
}
