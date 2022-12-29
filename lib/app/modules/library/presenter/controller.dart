import 'package:get/get.dart';

import '../../../core/entities/_entities.dart';
import '../../../core/services/tab_navigator.dart';
import '../../../core/services/track_list.dart';
import 'state.dart';

class LibraryController extends GetxController with LibraryState {
  final ITabNavigatorService tabNavigator;
  final ITrackListService _trackListService;

  LibraryController(
    this.tabNavigator,
    this._trackListService,
  );

  @override
  void onInit() {
    _updateTracks();
    _trackListService.trackStream.listen(_trackListListener);

    super.onInit();
  }

  Future<void> _updateTracks() async {
    tracks.value = _trackListService.tracks.reversed.toList();
  }

  void _trackListListener(List<Track> serviceTracks) {
    final lastTrack = serviceTracks.last;
    final hasRepeated = tracks.indexWhere((e) => e == lastTrack) != -1;

    if (!hasRepeated) {
      tracks.insert(0, lastTrack);
    }
  }
}
