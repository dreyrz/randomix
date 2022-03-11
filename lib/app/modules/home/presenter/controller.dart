import 'dart:developer' as dev;
import 'dart:math';

import 'package:get/get.dart';
import 'package:randomix/app/core/services/genres_list.dart';
import 'package:randomix/app/core/services/track_list.dart';

import '../../../core/services/tab_navigator.dart';
import '../../../core/utils/usecase.dart';
import 'state.dart';

class HomeController extends GetxController with HomeState {
  final IUseCase _getRandomTrackByGenreUseCase;

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

  late String selectedGenre;

  @override
  void onInit() {
    genresList.addAll(_genresListService.genres);
    selectedGenre = _genresListService.genres.first;
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

  void onGenreSelected(String genre) => selectedGenre = genre;

  Future<void> getRandomTrack() async {
    if (selectedGenre == 'aleatório') {
      final index = _random.nextInt(genresList.length);
      await _getRandomTrackByGenre(genresList[index]);
      return;
    }
    await _getRandomTrackByGenre(selectedGenre);
  }
}
