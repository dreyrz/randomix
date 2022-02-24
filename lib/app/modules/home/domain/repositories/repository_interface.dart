import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/track.dart';

abstract class IHomeRepository {
  Future<Either<Failure, Track>> getRandomTrackByGenre(String genre);

  Future<Either<Failure, List<String>>> getGenres();
}
