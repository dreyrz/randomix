import 'dart:developer' as dev;
import 'dart:math';

import 'package:get/get.dart';

import '../../../core/constants/strings.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/_services.dart';
import '../../../core/utils/usecase.dart';
import '../domain/entities/track.dart';
import 'state.dart';

class HomeController extends GetxController with HomeState {
  final IUseCase<String, Track> _getRandomTrackByGenreUseCase;

  final ITabNavigatorService tabNavigator;
  final ITrackListService _trackListService;
  final IGenresListService _genresListService;

  final Random _random;
  HomeController(
    this._getRandomTrackByGenreUseCase,
    this.tabNavigator,
    this._trackListService,
    this._genresListService,
    this._random,
  );

  late String _selectedGenre;

  @override
  void onInit() {
    genresList.addAll(_genresListService.genres);
    _selectedGenre = _genresListService.genres.first;
    super.onInit();
  }

  Future<void> _getRandomTrackByGenre(String genre) async {
    final res = await _getRandomTrackByGenreUseCase(genre);
    res.fold(
      (l) => dev.log(l.toString(), name: 'getRandomTrackByGenre'),
      (track) {
        trackList.add(track);
        _trackListService.addTrack(track);
      },
    );
  }

  void setGenreSelected(String genre) => _selectedGenre = genre;

  Future<void> getRandomTrack() async {
    if (_selectedGenre == Get.find<IStrings>().random) {
      final index = _random.nextInt(genresList.length);
      await _getRandomTrackByGenre(genresList[index]);
    } else {
      await _getRandomTrackByGenre(_selectedGenre);
    }
    Get.toNamed(Routes.trackDetails, arguments: trackList.last);
  }
}
