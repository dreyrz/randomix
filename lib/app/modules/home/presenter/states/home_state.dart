import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../domain/entities/track.dart';

mixin HomeState {
  final x = Rx<int>(0);
  final trackList = RxList<Track>([]);
  final isLoading = Rx<bool>(false);
}
