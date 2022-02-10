import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/track.dart';

abstract class IHomeRepository {
  Future<Either<Failure, Track>> getRandomTrackByGenre(String genre);
}
