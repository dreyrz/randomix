import 'package:get/get_rx/src/rx_types/rx_types.dart';

mixin HomeState {
  final genresList = RxList<String>();
  final isNotificationsEnabled = RxBool(true);
}
