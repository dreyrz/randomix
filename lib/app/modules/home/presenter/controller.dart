import 'dart:developer';

import 'package:get/get.dart';
import 'package:randomix/app/core/services/track_list.dart';

import '../../../core/services/tab_navigator.dart';
import '../../../core/utils/usecase.dart';
import 'state.dart';

class HomeController extends GetxController with HomeState {
  final IUseCase _getRandomTrackByGenre;
  final ITabNavigator tabNavigator;
  final ITrackListService _trackListService;
  HomeController(
    this._getRandomTrackByGenre,
    this.tabNavigator,
    this._trackListService,
  );

  Future<void> getRandomTrackByGenre(String genre) async {
    final res = await _getRandomTrackByGenre('pop');
    res.fold(
      (l) {
        log("error $l");
      },
      (track) {
        trackList.add(track);
        _trackListService.addTrack(track);
      },
    );
  }
}
