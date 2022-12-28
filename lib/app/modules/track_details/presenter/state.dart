import 'package:get/state_manager.dart';
import '../../../core/entities/_entities.dart';
import '../../../core/services/_services.dart';

mixin TrackDetailsState {
  final duration = Rx<Duration>(const Duration(seconds: 0));
  final status = Rx<PlayerStatus>(PlayerStatus.stopped);
  int currentIndex = 0;
  bool loading = false;
  late final Rx<Track> currentTrack;
}
