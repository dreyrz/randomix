import 'package:audioplayers/audioplayers.dart';

typedef PlayerPositionCallback = void Function(Duration duration);
typedef PlayerStatusCallback = void Function(PlayerStatus status);

enum PlayerStatus {
  stopped,
  playing,
  paused,
  completed,
}

abstract class IPlayer {
  Future<void> play(String url);
  Future<void> resume();
  Future<void> pause();
  Future<void> seek(Duration duration);
  Future<void> dispose();
  PlayerStatus get getStatus;
  void onPositionChanged(PlayerPositionCallback audioPlayerPositionCallback);
  void onStateChanged(PlayerStatusCallback playerStatusCallback);
}

class Player implements IPlayer {
  late final AudioPlayer _player;
  PlayerStatus _status = PlayerStatus.stopped;
  PlayerStatusCallback? _playerStatusCallback;
  Player() {
    _player = AudioPlayer();
  }

  @override
  PlayerStatus get getStatus => _status;

  @override
  Future<void> play(String url) async {
    await _player.play(UrlSource(url));
  }

  @override
  Future<void> resume() async {
    await _player.resume();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> seek(Duration duration) async {
    await _player.seek(duration);
  }

  @override
  Future<void> dispose() async {
    await _player.dispose();
  }

  @override
  void onPositionChanged(PlayerPositionCallback audioPlayerPositionCallback) {
    _player.onPositionChanged.listen(
      (duration) => audioPlayerPositionCallback(duration),
    );
  }

  @override
  void onStateChanged(PlayerStatusCallback playerStatusCallback) {
    _onFinished();
    _player.onPlayerStateChanged.listen((state) {
      _playerStatusCallback = playerStatusCallback;
      switch (state) {
        case PlayerState.stopped:
          _status = PlayerStatus.stopped;
          break;
        case PlayerState.paused:
          _status = PlayerStatus.paused;
          break;
        case PlayerState.playing:
          _status = PlayerStatus.playing;
          break;
        case PlayerState.completed:
          _status = PlayerStatus.completed;
          break;

        default:
          _status = PlayerStatus.completed;
      }
      playerStatusCallback(_status);
    });
  }

  void _onFinished() {
    _player.onPlayerComplete.listen((_) {
      _status = PlayerStatus.completed;

      if (_playerStatusCallback != null) {
        _playerStatusCallback!(_status);
      }
    });
  }
}
