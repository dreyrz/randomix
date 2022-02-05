import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/track.dart';

abstract class HomeRepository {
  Future<Either<Failure, Track>> getRandomTrackByGenre(String genre);
}
