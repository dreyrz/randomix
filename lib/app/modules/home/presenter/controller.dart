import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/api/api.dart';
import '../domain/usecases/get_random_track_by_genre.dart';
import 'state/states.dart';

class HomeController extends GetxController with HomeState {
  final GetRandomTrackByGenre _getRandomTrackByGenre;
  HomeController(this._getRandomTrackByGenre);

  @override
  void onInit() {
    _setToken();
    super.onInit();
  }

  void _setToken() {
    final token = Get.arguments;
    Get.find<IApi>().headers = {"Authorization": "Bearer $token"};
  }

  Future<void> getRandomTrackByGenre(String genre) async {
    isLoading.value = true;

    final res = await _getRandomTrackByGenre('pop');
    res.fold(
      (l) {
        log("error $l");
      },
      (r) => trackList.add(r),
    );
    isLoading.value = false;
  }
}
