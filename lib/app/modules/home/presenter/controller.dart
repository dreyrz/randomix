import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/services/api.dart';
import '../../../core/utils/interfaces/usecase.dart';
import 'state/states.dart';

class HomeController extends GetxController with HomeState {
  final IUseCase _getRandomTrackByGenre;
  final IUseCaseNoParams _getGenres;
  HomeController(this._getRandomTrackByGenre, this._getGenres);

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

  Future<void> getGenres() async {
    isLoading.value = true;
    final res = await _getGenres();
    isLoading.value = false;
  }
}
