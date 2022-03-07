import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/constants/strings.dart';
import '../../../core/services/tab_navigator.dart';
import '../../../core/utils/time.dart';
import '../../../core/utils/usecase.dart';
import 'state.dart';

class HomeController extends GetxController with HomeState {
  final IUseCase _getRandomTrackByGenre;
  final IUseCaseNoParams _getGenres;
  HomeController(this._getRandomTrackByGenre, this._getGenres);
  late final ITabNavigator tabNavigator;

  @override
  void onInit() {
    tabNavigator = Get.find<ITabNavigator>();
    super.onInit();
  }

  Future<void> getRandomTrackByGenre(String genre) async {
    final res = await _getRandomTrackByGenre('pop');
    res.fold(
      (l) {
        log("error $l");
      },
      (r) => trackList.add(r),
    );
  }

  String getGreetingString() {
    final period = Time.currentPeriod();
    final strings = Get.find<IStrings>();
    switch (period) {
      case Period.morning:
        return strings.goodMorning;

      case Period.afternoon:
        return strings.goodAfternoon;

      case Period.night:
        return strings.goodNight;

      default:
        return strings.goodDawn;
    }
  }

  Future<void> getGenres() async {
    final res = await _getGenres();
  }
}
