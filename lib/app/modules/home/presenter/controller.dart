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

  Future<void> _getRandomTrackByGenre(
      BuildContext context, String genre) async {
    final res = await _getRandomTrackByGenreUseCase(genre);
    res.fold(
      (l) {
        dev.log(l.toString(), name: 'getRandomTrackByGenre');
        showSnackBarMessage(context, message: "Erro", color: Colors.red);
      },
      (track) async {
        _trackListService.addTrack(track);
        await handleTrackStorage(track);
      },
    );
  }

  Future<void> handleTrackStorage(Track track) async {
    const tracksKey = StorageKeys.libraryTracks;
    final savedTracks = _storageService.readStringList(tracksKey);
    if (savedTracks != null) {
      await _storageService.setStringList(
        tracksKey,
        [...savedTracks, track.toJson()],
      );
      return;
    }
    await _storageService.setStringList(
      tracksKey,
      [track.toJson()],
    );
  }

  void setGenreSelected(String genre) {
    _selectedGenre = genre;
    _genresListService.currentGenre = genre;
  }

  Future<void> getRandomTrack(BuildContext context) async {
    if (_selectedGenre == Get.find<IStrings>().random) {
      final index = _random.nextInt(genresList.length);
      await _getRandomTrackByGenre(context, genresList[index]);
    } else {
      await _getRandomTrackByGenre(context, _selectedGenre);
    }
    Get.toNamed(Routes.trackDetails, arguments: _trackListService.tracks.last);
  }

  Future<void> enableNotifications(BuildContext context) async {
    final isNotificationsEnabledStorage =
        _storageService.readBool(StorageKeys.isNotificationsEnabled);

    if (isNotificationsEnabledStorage == true) {
      isNotificationsEnabled.value = false;
      await _storageService.setBool(StorageKeys.isNotificationsEnabled, false);
      await _backgroundTaskService.cancelAll();
      showSnackBarMessage(context, message: "Notificações canceladas");
      return;
    }

    isNotificationsEnabled.value = true;
    await _storageService.setBool(StorageKeys.isNotificationsEnabled, true);
    await _backgroundTaskService.schedule();
    showSnackBarMessage(context, message: "Notificações ativas");
  }

  void showSnackBarMessage(
    BuildContext context, {
    required String message,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color ?? Theme.of(context).secondaryHeaderColor,
        content: Text(message),
      ),
    );
  }
}
