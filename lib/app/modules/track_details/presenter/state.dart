import 'package:get/state_manager.dart';

import '../../../core/entities/_entities.dart';
import '../../../core/services/_services.dart';

mixin TrackDetailsState {
  late final Track track;
  final duration = Rx<Duration>(const Duration(seconds: 0));
  final status = Rx<PlayerStatus>(PlayerStatus.stopped);
}
