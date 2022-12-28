import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:randomix/app/core/services/notification.dart';

import '../../../core/entities/_entities.dart';
import '../../../core/services/tab_navigator.dart';
import '../../../core/services/track_list.dart';
import 'state.dart';

class LibraryController extends GetxController with LibraryState {
  final ITabNavigatorService tabNavigator;
  final ITrackListService _trackListService;

  final INotificationService _notificationService;
  LibraryController(
    this.tabNavigator,
    this._trackListService,
    this._notificationService,
  );

  @override
  void onInit() {
    _trackListService.trackStream.listen(_trackListListener);
    _notificationService.onPushStream.listen(_notificationPushListener);
    _updateTracks();
    super.onInit();
  }

  Future<void> _updateTracks() async {
    tracks.value = _trackListService.tracks.reversed.toList();
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
