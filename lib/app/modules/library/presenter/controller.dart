import 'package:get/get.dart';
import 'package:randomix/app/core/services/tab_navigator.dart';
import 'package:randomix/app/core/services/track_list.dart';

import 'state.dart';

class LibraryController extends GetxController with LibraryState {
  final ITabNavigator tabNavigator;
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
    tracks.add(trackListService.tracks.last);
  }
}
