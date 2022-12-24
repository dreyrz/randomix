import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:randomix/app/core/constants/storage_keys.dart';
import 'package:randomix/app/core/services/notification.dart';
import 'package:randomix/app/core/services/storage.dart';

import '../../../core/entities/_entities.dart';
import '../../../core/services/tab_navigator.dart';
import '../../../core/services/track_list.dart';
import 'state.dart';

class LibraryController extends GetxController with LibraryState {
  final ITabNavigatorService tabNavigator;
  final ITrackListService _trackListService;
  final IStorageService _storageService;
  final INotificationService _notificationService;
  LibraryController(
    this.tabNavigator,
    this._trackListService,
    this._storageService,
    this._notificationService,
  );

  @override
  void onInit() {
    _trackListService.trackStream.listen(_trackListListener);
    _notificationService.onPushStream.listen(_notificationPushListener);
    super.onInit();
  }

  @override
  void onReady() {
    getStorageTracks();
    super.onReady();
  }

  Future<void> getStorageTracks() async {
    final savedTracks = _storageService.readStringList(
      StorageKeys.libraryTracks,
    );
    if (savedTracks != null) {
      _trackListService.addAllTracks(
        savedTracks.map((t) => Track.fromJson(t)).toList(),
      );
      _trackListService.clearTracksAdded();
    }
  }

  void _trackListListener(List<Track> serviceTracks) {
    final lastTrack = serviceTracks.last;
    final hasRepeated = tracks.indexWhere((e) => e.id == lastTrack.id) != -1;

    if (!hasRepeated) {
      tracks.insert(0, lastTrack);
    }
  }

  void _notificationPushListener(ReceivedNotification action) {
    if (action.payload != null) {
      _trackListService.addTrack(Track.fromJson(action.payload!["track"]!));
    }
  }
}
