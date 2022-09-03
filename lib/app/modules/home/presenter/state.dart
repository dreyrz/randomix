import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/entities/_entities.dart';

mixin HomeState {
  final trackList = RxList<Track>();
  final genresList = RxList<String>();
  final enabledNotifications = RxBool(true);
}
