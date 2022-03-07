import 'package:get/get.dart';
import 'package:randomix/app/core/services/tab_navigator.dart';

import 'state.dart';

class HistoryController extends GetxController with HistoryState {
  final ITabNavigator tabNavigator;
  HistoryController(this.tabNavigator);
}
