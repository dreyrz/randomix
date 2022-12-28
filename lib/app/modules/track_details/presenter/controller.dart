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
    currentTrack = Rx<Track>(_trackListService.tracks.last);
    currentIndex = tracksLength - 1;
    _addCallbacks();
    _trackListService.trackStream.listen(_trackListListener);
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
      log('going backwards');
      currentIndex--;
      currentTrack.value = _trackListService.tracks[currentIndex];
    }
    log("current track name ${currentTrack.value.name} index $currentIndex");
  }

  Future<void> skipForward() async {
    if (currentIndex < tracksLength - 1) {
      log('going forward');
      currentIndex++;
      currentTrack.value = _trackListService.tracks[currentIndex];
    } else if (!loading) {
      log('going forward with request');
      await _getNextTrack();
    }
    log("current track name ${currentTrack.value.name} index $currentIndex");
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
    loading = false;
  }

  void _trackListListener(List<Track> tracks) {
    log(tracks.length.toString());
  }
}
