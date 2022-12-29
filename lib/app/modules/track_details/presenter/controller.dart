import 'dart:developer';
import 'package:get/get.dart';

import '../../../core/entities/_entities.dart';
import '../../../core/services/_services.dart';
import '../../home/domain/usecases/home_usecase_factory.dart';
import 'state.dart';

class TrackDetailsController extends GetxController with TrackDetailsState {
  final IPlayer _player;
  final IUrlLauncherService _urlLauncherService;
  final ITrackListService _trackListService;
  final IGenresListService _genresListService;
  final IHomeUseCaseFactory _homeUseCase;

  TrackDetailsController(
    this._player,
    this._urlLauncherService,
    this._trackListService,
    this._genresListService,
    this._homeUseCase,
  );

  int get tracksLength => _trackListService.tracks.length;

  @override
  void onInit() {
    currentTrack = Rx<Track>(Get.arguments);
    _handleCurrentIndex();
    _addCallbacks();
    _playTrackDelayed();
    super.onInit();
  }

  @override
  void onClose() {
    _player.dispose();
    super.onClose();
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

  Future<void> openSpotify() async {
    await _urlLauncherService
        .launchURL("spotify:track:${currentTrack.value.id}");
  }

  void skipBackwards() {
    if (currentIndex > 0) {
      currentIndex--;
      currentTrack.value = _trackListService.tracks[currentIndex];
      _resetStates();
    }
  }

  Future<void> skipForward() async {
    if (currentIndex < tracksLength - 1) {
      currentIndex++;
      currentTrack.value = _trackListService.tracks[currentIndex];
      _resetStates();
    } else if (!loading) {
      await _getNextTrack();
    }
  }

  Future<void> _getNextTrack() async {
    loading = true;
    String genre = _genresListService.currentGenre;
    if (_genresListService.isRandomGenreSelected) {
      genre = _genresListService.getRandomGenre();
    }
    final res = await _homeUseCase.getRandomTrackByGenreUseCase().call(genre);
    res.fold((l) => log(l.toString()), (track) {
      _trackListService.addTrack(track);
      currentTrack.value = _trackListService.tracks.last;
    });
    currentIndex++;
    _resetStates();
    loading = false;
  }

  void _handleCurrentIndex() {
    final index = _trackListService.tracks.indexOf(currentTrack.value);
    if (index != -1) {
      currentIndex = index;
    } else {
      currentIndex = tracksLength - 1;
    }
  }

  void _resetStates() {
    duration.value = Duration.zero;
    _playTrackDelayed();
  }

  Future<void> _playTrackDelayed() async {
    final previewUrl = currentTrack.value.previewUrl;
    if (previewUrl != null) {
      await Future.delayed(const Duration(milliseconds: 300))
          .then((_) => playTrack(currentTrack.value.previewUrl!));
    }
  }
}
