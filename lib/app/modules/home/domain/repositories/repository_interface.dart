import 'package:dartz/dartz.dart';

import '../../../../core/entities/_entities.dart';
import '../../../../core/errors/failure.dart';

abstract class IHomeRepository {
  Future<Either<Failure, Track>> getRandomTrackByGenre(String genre);
}
