import 'dart:developer';

import 'package:get/get.dart';
import 'package:randomix/app/core/constants/storage_keys.dart';
import 'package:randomix/app/core/services/storage.dart';

import '../../../core/entities/_entities.dart';
import '../../../core/services/tab_navigator.dart';
import '../../../core/services/track_list.dart';
import 'state.dart';

class LibraryController extends GetxController with LibraryState {
  final ITabNavigatorService tabNavigator;
  final ITrackListService _trackListService;
  final IStorageService _storageService;
  LibraryController(
    this.tabNavigator,
    this._trackListService,
    this._storageService,
  );

  @override
  void onInit() {
    _trackListService.addListener(trackListListener);
    super.onInit();
  }

  @override
  void onReady() {
    getStorageTracks();
    super.onReady();
  }

  @override
  void onClose() {
    _trackListService.removeListener(trackListListener);
    super.onClose();
  }

  Future<void> getStorageTracks() async {
    final savedTracks = _storageService.readStringList(
      StorageKeys.libraryTracks,
    );
    if (savedTracks != null) {
      _trackListService.addAllTracks(
        savedTracks.map((t) => Track.fromJson(t)).toList(),
      );
    }
  }

  void trackListListener() {
    final track = _trackListService.tracks.last;
    bool hasRepeated = false;
    for (final t in tracks) {
      if (t.id == track.id) {
        hasRepeated = true;
      }
    }
    if (hasRepeated) {
      return;
    }
    tracks.insert(0, _trackListService.tracks.last);
  }
}
