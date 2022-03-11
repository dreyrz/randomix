import 'package:get/get.dart';

import '../../../core/services/tab_navigator.dart';
import '../../../core/services/track_list.dart';
import 'state.dart';

class LibraryController extends GetxController with LibraryState {
  final ITabNavigatorService tabNavigator;
  final ITrackListService trackListService;
  LibraryController(this.tabNavigator, this.trackListService);

  @override
  void onInit() {
    trackListService.addListener(trackListListener);
    super.onInit();
  }

  @override
  void onClose() {
    trackListService.removeListener(trackListListener);
    super.onClose();
  }

  void trackListListener() {
    final track = trackListService.tracks.last;
    bool hasRepeated = false;
    for (final t in tracks) {
      if (t.id == track.id) {
        hasRepeated = true;
      }
    }
    if (hasRepeated) {
      return;
    }
    tracks.insert(0, trackListService.tracks.last);
  }
}
