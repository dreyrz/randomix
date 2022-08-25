import 'package:get/state_manager.dart';

import '../../../core/services/_services.dart';
import '../../home/domain/entities/track.dart';

mixin TrackDetailsState {
  late final Track track;
  final duration = Rx<Duration>(const Duration(seconds: 0));
  final status = Rx<PlayerStatus>(PlayerStatus.stopped);
}
