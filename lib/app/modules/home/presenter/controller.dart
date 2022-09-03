import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/_constants.dart';
import '../../../core/entities/_entities.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/_services.dart';
import '../../../core/utils/usecase.dart';

import 'state.dart';

class HomeController extends GetxController with HomeState {
  final IUseCaseParams<String, Track> _getRandomTrackByGenreUseCase;

  final ITabNavigatorService tabNavigator;
  final ITrackListService _trackListService;
  final IGenresListService _genresListService;
  final IStorageService _storageService;
  final IBackgroundTaskService _backgroundTaskService;

  final Random _random;
  HomeController(
    this._getRandomTrackByGenreUseCase,
    this.tabNavigator,
    this._trackListService,
    this._genresListService,
    this._storageService,
    this._backgroundTaskService,
    this._random,
  );

  late String _selectedGenre;
  @override
  void onReady() {
    isNotificationsEnabled.value =
        _storageService.readBool(StorageKeys.isNotificationsEnabled) ?? false;
    super.onReady();
  }

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

  Future<void> enableNotifications(BuildContext context) async {
    final isNotificationsEnabledStorage =
        _storageService.readBool(StorageKeys.isNotificationsEnabled);

    if (isNotificationsEnabledStorage == true) {
      isNotificationsEnabled.value = false;
      await _storageService.setBool(StorageKeys.isNotificationsEnabled, false);
      await _backgroundTaskService.cancelAll();

      dev.log("canceled notifications");
      showSnackBarMessage(context, message: "Notificações canceladas");
      return;
    }

    isNotificationsEnabled.value = true;
    await _storageService.setBool(StorageKeys.isNotificationsEnabled, true);
    await _backgroundTaskService.schedule();
    dev.log("scheduled notifications");
    showSnackBarMessage(context, message: "Notificações ativas");
  }

  void showSnackBarMessage(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).backgroundColor,
        content: Text(message),
      ),
    );
  }
}
