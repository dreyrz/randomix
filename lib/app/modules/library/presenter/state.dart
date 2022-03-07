import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../home/domain/entities/track.dart';

mixin LibraryState {
  final tracks = RxList<Track>();
}
